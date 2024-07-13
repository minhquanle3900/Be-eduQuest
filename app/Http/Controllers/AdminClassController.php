<?php

namespace App\Http\Controllers;

use App\Models\classes;
use App\Models\student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class AdminClassController extends Controller
{
    public function getClasses()
    {
        $data = classes::get();

        return response()->json([
            'data'    => $data
        ]);
    }


    public function destroy(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'class_id' => 'required|exists:classes,class_id'
        ], [
            'class_id.*' => 'Lớp không tồn tại!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $class = classes::find($request->class_id);

        if (!$class) {
            return response()->json([
                'status'    => false,
                'message'   => 'Lớp không tồn tại trên hệ thống!',
            ]);
        }

        DB::beginTransaction();

        $students = student::where('class_id', $class->class_id)->get();

        foreach ($students as $student) {
            $student->class_id = 99; //cái này cần set lại db cho defaul class_id = 99 là lớp chứa những sinh viên bị xóa Lớp nhé ae!
            $student->save();
        }

        DB::table('chats')->where('class_id', $class->class_id)->delete();
        DB::table('student_notifications')->where('class_id', $class->class_id)->delete();
        $class->delete();

        DB::commit();

        return response()->json([
            'status'    => true,
            'message'   => 'Xóa Lớp thành công!',
        ]);
    }

    public function update(Request $request)
    {
        $class = classes::find($request->class_id);
        $data = $request->all();

        if ($class) {
            $class->update($data);

            return response()->json([
                'status'    => true,
                'message'   => 'Đã lấy được thông tin Lớp thành công!',
            ]);
        } else {
            return response()->json([
                'status'    => false,
                'message'   => 'Lớp không tồn tại trên hệ thống!',
            ]);
        }
    }

    public function edit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'grade_id'      => 'required|exists:grades,grade_id',
            'class_name'    => 'required|string',
            'teacher_id'    => 'required|exists:teachers,teacher_id',
        ], [
            'grade_id.required'     => 'Khối không được để trống!',
            'grade_id.exists'       => 'Khối không tồn tại trong cơ sở dữ liệu!',
            'class_name.required'   => 'Tên Lớp không được để trống!',
            'teacher_id.required'   => 'Giáo viên không được để trống!',
            'teacher_id.exists'     => 'Giáo viên không tồn tại trong cơ sở dữ liệu!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $class = classes::find($request->class_id);

        if (!$class) {
            return response()->json([
                'status' => false,
                'message' => 'Lớp không tồn tại trên hệ thống!',
            ]);
        }

        $class->fill($request->all());
        $class->save();

        return response()->json([
            'message'   => 'Sửa thông tin lớp thành công!',
            "class" => $class
        ]);
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'grade_id'      => 'required',
            'class_name'    => 'required|string|unique:classes,class_name',
            'teacher_id'    => 'required|exists:teachers,teacher_id',
        ], [
            'grade_id.required'     => 'Khối không được để trống!',
            'grade_id.exists'       => 'Khối không tồn tại trong cơ sở dữ liệu!',
            'class_name.required'   => 'Tên Lớp không được để trống!',
            'class_name.unique'     => 'Tên Lớp đã tồn tại!',
            'teacher_id.required'   => 'Giáo viên không được để trống!',
            'teacher_id.exists'     => 'Giáo viên không tồn tại trong cơ sở dữ liệu!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $data = $request->all();

        $class = classes::create($data);

        return response()->json([
            'message'   => 'Đã tạo mới Lớp thành công!',
            "class" => $class
        ]);
    }

    public function search(Request $request)
    {
        $data = classes::join('teachers' , 'teachers.teacher_id' , 'classes.teacher_id')
                        ->select('classes.*', 'teachers.name')
                        ->where('class_name', 'like', '%' . $request->key_search . '%')
                        ->orWhere('teachers.name', 'like', '%' . $request->key_search . '%')
                        ->get();

        return response()->json([
            'data'  => $data
        ]);
    }

    public function deleteCheckbox(Request $request)
    {
        $data = $request->all();
        $deletedClasses = [];

        foreach ($data as $key => $value) {
            if (isset($value['check'])) {
                $classId = $value['class_id'];
                $class = classes::find($classId);

                if ($class) {
                    $students = student::where('class_id', $class->class_id)->get();

                    foreach ($students as $student) {
                        if ($student->class_id !== null) {
                            $student->class_id = 1;
                            $student->save();
                        }
                    }

                    DB::table('chats')->where('class_id', $class->class_id)->delete();
                    DB::table('student_notifications')->where('class_id', $class->class_id)->delete();

                    $class->delete();
                    $deletedClasses[] = $classId;
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => 'Lớp có class_id ' . $classId . ' không tồn tại!',
                    ]);
                }
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Xóa các lớp thành công!',
            'deleted_classes' => $deletedClasses,
        ]);
    }
}
