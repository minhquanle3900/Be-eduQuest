<?php

namespace App\Http\Controllers;

use App\Models\classes;
use Illuminate\Http\Request;
use App\Models\notifications;
use App\Models\student_notifications;
use App\Models\teacher;
use App\Models\teacher_notifications;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class AdminNotificationController extends Controller
{
    // danh sách thông báo cho gv
    public function listNotificationGV()
    {
        $getListGV = notifications::whereExists(function ($query) {
            $query->select(DB::raw(1))
                ->from('teacher_notifications')
                ->whereColumn('teacher_notifications.notification_id', 'notifications.notification_id');
        })->get();
        if ($getListGV->isEmpty()) {
            return response()->json([
                'message' => 'Không tìm thấy dữ liệu',
            ], 400);
        }
        return response()->json([
            'message' => 'Thành công',
            'data' => $getListGV
        ]);
    }



    // danh sách thông báo cho học sinh
    public function listNotificationHS()
    {
        $getListHS = notifications::whereExists(function ($query) {
            $query->select(DB::raw(1))
                ->from('student_notifications')
                ->whereColumn('student_notifications.notification_id', 'notifications.notification_id');
        })->get();
        if ($getListHS->isEmpty()) {
            return response()->json([
                'message' => 'Không tìm thấy dữ liệu',
            ], 400);
        }
        return response()->json([
            'message' => 'Thành công',
            'data' => $getListHS
        ]);
    }

    // gửi thông báo
    public function sendNotification(Request $request)
    {
        $user = $request->user('admins');

        $validator = Validator::make($request->all(), ([
            'notification_title' => 'required',
            'notification_content' => 'required',
            'teacher_id' => 'array|min:1|exists:teachers,teacher_id',
            'teacher_id.*' => 'required|integer',
            'class_id' => 'array|min:1|exists:classes,class_id',
            'class_id.*' => 'required|integer',
        ]), [
            'notification_title.required' => 'Tiêu đề thông báo không được để trống.',
            'notification_content.required' => 'Nội dung thông báo không được để trống.',
            'teacher_id.array' => 'Giáo viên nhận thông báo phải là một mảng.',
            'teacher_id.exists' => 'Giáo viên nhận thông báo không có trong cơ sở dữ liệu.',
            'teacher_id.min' => 'Phải chọn ít nhất một giáo viên nhận thông báo.',
            'teacher_id.*.required' => 'Mỗi giáo viên nhận thông báo trong danh sách là bắt buộc.',
            'teacher_id.*.integer' => 'ID của giáo viên phải là một số nguyên.',
            'class_id.array' => 'Lớp học nhận thông báo phải là một mảng.',
            'class_id.exists' => 'Lớp học nhận thông báo không có trong cơ sở dữ liệu.',
            'class_id.min' => 'Phải chọn ít nhất một lớp học nhận thông báo.',
            'class_id.*.required' => 'Mỗi lớp học nhận thông báo trong danh sách là bắt buộc.',
            'class_id.*.integer' => 'ID của lớp học phải là một số nguyên.',
        ]);
        if ($validator->passes() && empty($request->teacher_id) && empty($request->class_id)) {
            return response()->json([
                'error' => 'Bạn cần chọn ít nhất một giáo viên hoặc một lớp học để gửi thông báo.',
            ], 422);
        }
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors(),
            ], 422);
        }

        $notification = new notifications([
            'username' => $user->username,
            'name' => $user->name,
            'notification_title' => $request->notification_title,
            'notification_content' => $request->notification_content,
            'time_sent' => Carbon::now('Asia/Ho_Chi_Minh'),
        ]);
        $notification->saveQuietly();
        $teacherNames = [];
        $classNames = [];

        if (!empty($request->teacher_id)) {
            foreach ($request->teacher_id as $teacherId) {
                $teacher = teacher::find($teacherId);
                if ($teacher) {
                    $teacherNames[] = $teacher->name;
                    $sendTeacherNotification = new teacher_notifications([
                        'notification_id' => $notification->id,
                        'teacher_id' => $teacherId
                    ]);
                    $sendTeacherNotification->saveQuietly();
                }
            }
        }
        if (!empty($request->class_id)) {
            foreach ($request->class_id as $classId) {
                $class = classes::find($classId);
                if ($class) {
                    $classNames[] = $class->class_name;
                    $sendClassNotification = new student_notifications([
                        'notification_id' => $notification->id,
                        'class_id' => $classId
                    ]);
                    $sendClassNotification->saveQuietly();
                }
            }
        }

        $message = 'Gửi thông báo thành công!';
        if (!empty($teacherNames)) {
            $message .= ' Đã gửi đến giáo viên: ' . implode(', ', $teacherNames) . '.';
        }
        if (!empty($classNames)) {
            $message .= ' Đã gửi đến lớp: ' . implode(', ', $classNames) . '.';
        }

        return response()->json([
            'message' => $message,
            'data' => $notification
        ], 200);
    }

    public function sendAllTeacher(Request $request)
    {
        $user = $request->user('admins');
        $validator = Validator::make($request->all(), [
            'notification_title' => 'required',
            'notification_content' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors(),
            ], 422);
        }
        // Lấy danh sách tất cả các giáo viên trong hệ thống
        $allTeachers = Teacher::pluck('teacher_id');
        $notification = notifications::create([
            'username' => $user->username,
            'name' => $user->name,
            'notification_title' => $request->notification_title,
            'notification_content' => $request->notification_content,
            'time_sent' => Carbon::now('Asia/Ho_Chi_Minh'),
        ]);
        $notification->save();
        // Gửi thông báo cho tất cả các giáo viên
        foreach ($allTeachers as $teacher) {
            teacher_notifications::create(["notification_id" => $notification->notification_id, "teacher_id" => $teacher]);
        }
        ;
        $id_user = $user->admin_id;
        return response()->json([
            'id_user' => $id_user,
            'message' => 'Gửi thông báo đến tất cả giáo viên thành công!',
            'data' => $notification
        ], 200);
    }

    public function sendAlClasses(Request $request)
    {
        $user = $request->user('admins');
        $validator = Validator::make($request->all(), [
            'notification_title' => 'required',
            'notification_content' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors(),
            ], 422);
        }
        $allClasses = classes::pluck('class_id');
        // Create notification for each class
        $notification = notifications::create([
            'username' => $user->username,
            'name' => $user->name,
            'notification_title' => $request->notification_title,
            'notification_content' => $request->notification_content,
            'time_sent' => Carbon::now('Asia/Ho_Chi_Minh'),
        ]);
        $notification->save();
        foreach ($allClasses as $classId) {
            student_notifications::create(["notification_id" => $notification->notification_id, "class_id" => $classId]);
        }
        ;
        $id_user = $user->admin_id;
        return response()->json([
            'id_user' => $id_user,
            'message' => 'Gửi thông báo đến tất cả lớp học thành công!',
            'data' => $notification
        ], 200);
    }
}
