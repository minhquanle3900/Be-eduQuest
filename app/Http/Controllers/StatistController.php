<?php

namespace App\Http\Controllers;

use App\Models\admin;
use App\Models\classes;
use App\Models\notifications;
use App\Models\practice;
use App\Models\practice_scores;
use App\Models\quest_of_practice;
use App\Models\quest_of_test;
use App\Models\questions;
use App\Models\scores;
use App\Models\student;
use App\Models\student_notifications;
use App\Models\subject_head;
use App\Models\subjects;
use App\Models\teacher;
use App\Models\teacher_notifications;
use App\Models\tests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StatistController extends Controller
{
    //Thống kê của ADMIN

    //Thống kê điểm làm bài thi cao nhất trong 7 ngày
    public function statistHighScoresSevenDay(Request $request)
    {
        $currentDate = now('Asia/Ho_Chi_Minh');
        $sevenDaysAgo = $currentDate->copy()->subDays(7);

        // Truy vấn cơ sở dữ liệu để lấy tất cả các điểm làm bài thi cao nhất trong 7 ngày qua
        $highestScores = scores::join('tests', 'scores.test_code', '=', 'tests.test_code')
                                ->whereBetween('scores.completion_time', [$sevenDaysAgo, $currentDate])
                                ->select('tests.test_code', 'tests.test_name', DB::raw('MAX(scores.score_number) as highest_score'))
                                ->groupBy('tests.test_code', 'tests.test_name')
                                ->orderBy('highest_score', 'desc')
                                ->get();

        return response()->json([
            'message' => 'Thống kê điểm làm bài thi cao nhất trong 7 ngày qua',
            'data' => $highestScores
        ], 200);
    }
    //Toàn bộ điểm trong 7 ngày
    public function statistScoresSevenDay(Request $request)
    {
        $currentDate = now('Asia/Ho_Chi_Minh');
        $sevenDaysAgo = $currentDate->copy()->subDays(7);

        // Truy vấn cơ sở dữ liệu để lấy tất cả các điểm trong 7 ngày qua
        $allScores = scores::join('tests', 'scores.test_code', '=', 'tests.test_code')
                            ->whereBetween('scores.completion_time', [$sevenDaysAgo, $currentDate])
                            ->select('scores.student_id', 'scores.test_code', 'scores.score_number', 'scores.score_detail', 'scores.completion_time', 'tests.test_name')
                            ->orderBy('scores.completion_time', 'desc')
                            ->get();

        return response()->json([
            'message' => 'Thống kê toàn bộ điểm trong 7 ngày qua',
            'data' => $allScores
        ], 200);
    }
    public function visitStatistsSevenDay(Request $request)
    {
        $userType = ['admins', 'subject_heads', 'teachers', 'students'];
        foreach ($userType as $type) {
            $user = $request->user($type);
            if ($user) {
                break;
            }
        }
        if (!$user) {
            return response()->json([
                'message' => 'Người dùng không tồn tại!',
            ], 403);
        }

        $currentDate = now('Asia/Ho_Chi_Minh');
        $visitByDay = [];

        // Lặp qua từng ngày trong 7 ngày qua
        for ($i = 0; $i < 7; $i++) {
            // Tính ngày hiện tại
            $date = $currentDate->copy()->subDays($i);
            // Lấy số lượt truy cập của từng loại người dùng trong ngày
            $adminVisits = Admin::whereDate('last_login', $date)->count();
            $teacherVisits = Teacher::whereDate('last_login', $date)->count();
            $studentVisits = Student::whereDate('last_login', $date)->count();
            $subjectHeadVisits = Subject_Head::whereDate('last_login', $date)->count();
            // Thêm vào mảng kết quả
            $visitByDay[$date->toDateString()] = [
                'admin' => $adminVisits,
                'teacher' => $teacherVisits,
                'student' => $studentVisits,
                'subject_head' => $subjectHeadVisits,
            ];
        }

        return response()->json([
            'message' => 'Thống kê lượt truy cập trong 7 ngày qua!',
            'data' => $visitByDay
        ], 200);
    }

    //số lần kiểm tra được làm trong 7 ngày
    public function statistTestSevenDay(Request $request)
    {
        $currentDate = now('Asia/Ho_Chi_Minh');
        $sevenDaysAgo = $currentDate->copy()->subDays(7);

        // Truy vấn cơ sở dữ liệu để lấy thống kê số bài thi được làm nhiều nhất trong 7 ngày qua
        $seven = scores::join('tests', 'scores.test_code', '=', 'tests.test_code')
            ->whereBetween('scores.completion_time', [$sevenDaysAgo, $currentDate])
            ->select('tests.test_code', 'tests.test_name', DB::raw('COUNT(scores.test_code) as times_taken'))
            ->groupBy('tests.test_code', 'tests.test_name')
            ->orderBy('times_taken', 'desc')
            ->get();

        return response()->json([
            'message' => 'Thống kê số bài thi được làm nhiều nhất trong 7 ngày qua',
            'data' => $seven
        ], 200);
    }
    //số lần kiểm tra của các môn trong 7 ngày
    public function statist(Request $request)
    {
        $currentDate = now('Asia/Ho_Chi_Minh');
        $sevenDaysAgo = $currentDate->copy()->subDays(7);

        //truy vấn cơ sở dữ liệu để lấy thống kê số lần kiểm tra của các môn
        $query = subjects::select('subjects.subject_detail', 'subjects.subject_id')
            ->leftJoin('tests', 'subjects.subject_id', '=', 'tests.subject_id')
            ->leftJoin('scores', 'tests.test_code', '=', 'scores.test_code')
            ->groupBy('subjects.subject_detail', 'subjects.subject_id');

        //lọc theo ngày
        $query->whereDate('scores.completion_time', '>=', $sevenDaysAgo)
            ->whereDate('scores.completion_time', '<=', $currentDate);

        if ($request->grade_id) {
            $query->where('tests.grade_id', $request->grade_id);
        }

        // Thống kê số lần kiểm tra
        $statistics = $query->selectRaw('SUM(IF(scores.test_code IS NOT NULL, 1, 0)) AS tested_time')
                            ->get();

        return response()->json([
            'message' => 'Thống kê thành công!',
            'data' => $statistics
        ]);
    }
    //Toàn bộ điểm có trên hệ thống
    public function statistScores(Request $request)
    {
        $query = scores::selectRaw('SUM(IF(scores.score_number < 5, 1, 0)) AS bad, SUM(IF(scores.score_number >= 5 AND scores.score_number < 6.5, 1, 0)) AS complete, SUM(IF(scores.score_number >= 6.5 AND scores.score_number < 8, 1, 0)) AS good, SUM(IF(scores.score_number >= 8, 1, 0)) AS excellent')
            ->leftJoin('tests', 'scores.test_code', '=', 'tests.test_code');

        if ($request->grade_id) {
            $query->where('tests.grade_id', $request->grade_id);
        }

        $scores = $query->get();

        return response()->json([
            'message' => 'Thống kê điểm số thành công!',
            'data' => $scores
        ]);
    }

    //Thống kê của học sinh
    public function statistStudent(Request $request)
    {
        $statistics = subjects::select('subjects.subject_detail', 'subjects.subject_id', DB::raw('SUM(IF(practice_scores.practice_code IS NOT NULL, 1, 0)) AS tested_time'))
            ->leftJoin('practice', 'subjects.subject_id', '=', 'practice.subject_id')
            ->leftJoin('practice_scores', 'practice.practice_code', '=', 'practice_scores.practice_code')
            ->where('practice.student_id', $request->user()->id)
            ->groupBy('subjects.subject_detail', 'subjects.subject_id')
            ->get();

        return response()->json([
            'message' => 'Thống kê thành công!',
            'data' => $statistics
        ]);
    }
    public function subjectScore(Request $request)
    {
        $statistics = practice_scores::select('practice_scores.score_number as score', 'practice_scores.completion_time as day')
            ->leftJoin('practice', 'practice_scores.practice_code', '=', 'practice.practice_code')
            ->leftJoin('subjects', 'practice.subject_id', '=', 'subjects.subject_id')
            ->where('practice.student_id', auth()->id())
            ->where('practice.subject_id', $request->subject_id)
            ->orderBy('practice_scores.completion_time')
            ->limit(10)
            ->get();

        return response()->json([
            'message' => 'Thống kê điểm môn học thành công!',
            'data' => $statistics
        ]);
    }

    public function allAdminPage()
    {
        $tableCounts = [
            'teacher' => teacher::count(),
            'student' => student::count(),
            'head' => subject_head::count(),
            'question' => questions::count(),
            'test' => tests::count(),
            'score' => scores::count(),
            'practice' => practice::count(),
            'practice_scores' => practice_scores::count(),
        ];

        return response()->json([
            'message' => 'Thống kê trả về dữ liệu số lượng bản ghi!',
            'data' => $tableCounts
        ], 200);
    }
    public function allStudentPage()
    {
        $openTestCount = tests::where('status_id', '2')->count();
        $tableCounts = [
            'practice' => practice::count(),
            'test' => $openTestCount,
            'chat' => student_notifications::count(),
            'notification' => notifications::count(),
        ];

        return response()->json([
            'message' => 'Thống kê trả về dữ liệu số lượng bản ghi!',
            'data' =>   $tableCounts
        ], 200);
    }
    //mấy cái ở dưới đây querry lấy dữ liệu mà thiếu nhiều column quá :))))
    //m xem làm được không thì fix thử t mỏi mắt quá rồi -.-
    // với lại xem cái login head_subject nha t vào không được!!!!
    public function allTeacherPage($teacher_id)
    {
        // Tìm id của các lớp mà giáo viên đó là chủ nhiệm
        $class_ids = classes::where('teacher_id', $teacher_id)->pluck('class_id')->toArray();

        // Lấy danh sách học sinh thuộc các lớp mà giáo viên đó là chủ nhiệm
        $students = student::whereIn('class_id', $class_ids)->pluck('student_id')->toArray();

        // Đếm số lượng câu hỏi mà giáo viên đó tạo
        $question_test = quest_of_test::whereIn('teacher_id', [$teacher_id])->count();
        $question_practice = quest_of_practice::whereIn('teacher_id', [$teacher_id])->count();
        $question_count = questions::where('teacher_id', $teacher_id)->count();

        $tableCounts = [
            'ngân hàng câu hỏi' => questions::count(),
            'câu hỏi của giáo viên' => $question_count,
            'câu hỏi test của giáo viên' => $question_test,
            'câu hỏi luyện thi của giáo viên' => $question_practice,
            'test' => tests::count(),
            'practice' => practice::count(),
            'câu hỏi test' => quest_of_test::count(),
            'thông báo của admin' => teacher_notifications::where('teacher_id', $teacher_id)->count(),
            'thông báo cho học sinh' => student_notifications::whereIn('class_id', $class_ids)->count(),
            'điểm của học sinh trong lớp' => scores::whereIn('student_id', $students)->count(),
        ];

        return response()->json([
            'message' => 'Thống kê trả về dữ liệu số lượng bản ghi!',
            'data' => $tableCounts
        ], 200);
    }

    public function allHeadPage($subject_head_id)
    {
        // Lấy danh sách các môn học mà trưởng bộ môn làm trưởng
        $subjects = subjects::where('subject_id', $subject_head_id)->pluck('subject_id')->toArray();

        // Đếm số lượng câu hỏi trong các môn học đó
        $question_count = Questions::whereIn('subject_id', $subjects)->count();

        // Đếm số lượng đề thi trong các môn học đó
        $test_count = Tests::whereIn('subject_id', $subjects)->count();

        $tableCounts = [
            'subject' => $subjects,
            'student' => Student::count(),
            'test' => $test_count,
            'score' => Scores::count(),
            'practice' => Practice::count(),
            'practice_scores' => Practice_Scores::count(),
            'câu hỏi trong môn học' => $question_count,
        ];

        return response()->json([
            'message' => 'Thống kê trả về dữ liệu số lần bản ghi!',
            'data' => $tableCounts
        ], 200);
    }
}
