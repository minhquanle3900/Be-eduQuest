<?php

namespace App\Http\Controllers;

use App\Events\MessageEdited;
use App\Events\MessageSent;
use App\Events\MessageUnsent;
use App\Models\chats;
use App\Models\practice;
use App\Models\practice_scores;
use App\Models\scores;
use App\Models\student;
use App\Models\student_practice_detail;
use App\Models\student_test_detail;
use App\Models\notifications;
use App\Models\student_notifications;
use App\Models\teacher_notifications;
use App\Models\tests;
use Carbon\Carbon;
use Carbon\CarbonTimeZone;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Ramsey\Uuid\Uuid;

class StudentController extends Controller
{
    public function resultTest(request $request)
    {
        $result = scores::join('tests', 'scores.test_code', '=', 'tests.test_code')
                        ->where('student_id', '=', $request->user('students')->student_id)
                        ->where('status_id', '=', 2)
                        ->select('scores.*', 'tests.test_name')
                        ->orderBy('completion_time','desc')
                        ->first();

        return response()->json(['data' => $result], 200);
    }
    public function getInfo(Request $request)
    {
        $username = $request->user('students')->username;
        $me = student::select('students.student_id', 'students.username', 'students.avatar', 'students.email', 'students.name', 'students.last_login', 'students.birthday', 'permissions.permission_detail', 'genders.gender_detail', 'genders.gender_id')
            ->join('permissions', 'students.permission', '=', 'permissions.permission')
            ->join('genders', 'students.gender_id', '=', 'genders.gender_id')
            ->where('students.username', '=', $username)
            ->first();

        return response()->json([
            'message' => 'Lấy thông tin cá nhân thành công!',
            'data' => $me
        ], 200);
    }
    public function getScore(Request $request)
    {
        $student = $request->user('students');
        $scores = scores::join('tests', 'scores.test_code', '=', 'tests.test_code')
                        ->where('student_id', $student->student_id)
                        ->select('scores.*', 'tests.test_name')
                        ->orderBy('completion_time','desc')
                        ->get();
        return response()->json(['data' => $scores], 200);
    }
    public function getPracticeScore(Request $request)
    {
        $student = $request->user('students');
        $scores = practice_scores::where('student_id', $student->student_id)->orderBy('completion_time','desc')-> get();
        return response()->json(['data' => $scores], 200);
    }
    public function getTest(Request $request){
    $user = $request->user('students');
    $grade_id = student::with("classes")->where("student_id", $user->student_id)->first()->classes->grade_id;
    $test = tests::where("grade_id", $grade_id)
                ->where('status_id', '=', 2)
                ->whereNotIn('test_code', function ($query) use ($user) {
                    $query->select('test_code')
                          ->from('scores')
                          ->where('student_id', $user->student_id);
                })
                ->orderBy('timest', 'desc')
                ->get();
    return response()->json(['data' => $test], 200);
    }
    public function getTestDetail(Request $request, $test_code)
    {
        $student_id = $request->user('students')->student_id;
        $starting_time = $request->user('students')->starting_time;
        $questions = [];
        $data  = tests::find($test_code);
        if (!$data) return response()->json(["message" => "Không tìm thấy đề thi!"], 400);
        $student_answers=[];
        // get student_answer from student_test_detail table and questions from questions table
        foreach ($data->questions as $question) {
            $questions[] = $question;
              $student_answers[] = student_test_detail::where('student_id', $student_id)
                ->where('test_code', $test_code)
                ->where('question_id', $question->question_id)
                ->first();
        }
        $data['questions'] = $questions;
        $data['student_answers'] = $student_answers;
        // time remaining in minutes will be now minus starting time plus time_to_do
        $data["time_remaining"] =strtotime($starting_time) +$data->time_to_do*60 -time();
        $data["now"]= date('Y-m-d H:i:s');

        return response()->json(["data" => $data]);
    }
    function getPracticeDetail (Request $request, $practice_code){
        $student_id = $request->user('students')->student_id;
        $starting_time = $request->user('students')->practice_starting_time;
        $practice = practice::find($practice_code);
        if (!$practice) return response()->json(["message" => "Không tìm thấy bài thi!"], 400);
        $questions = [];
        $student_answers=[];
        // get student_answer from student_practice_detail table and questions from questions table
        foreach ($practice->questions as $question) {
            $questions[] = $question;
              $student_answers[] = student_practice_detail::where('student_id', $student_id)
                ->where('practice_code', $practice_code)
                ->where('question_id', $question->question_id)
                ->first();
        }
        $practice['questions'] = $questions;
        $practice['student_answers'] = $student_answers;
         $practice["time_remaining"] =strtotime($starting_time) +$practice->time_to_do*60 -time();
          $practice["now"]= date('Y-m-d H:i:s');
        return response()->json(["data" => $practice]);

    }
    public function updateProfile(Request $request)
    {
        $me = $request->user('students');
        $validator = Validator::make($request->all(), [
            'name' => 'nullable|min:3|max:255',
            'gender_id' => 'nullable|integer',
            'birthday' => 'nullable|date',
            'password' => 'nullable|min:6|max:20',
            'email' => 'nullable|email|unique:admins,email',
            'avatar' => 'nullable|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $data = $request->only(['name', 'gender_id', 'birthday', 'email', 'permission']);

        if ($request->filled('password')) {
            $data['password'] = bcrypt($request->password);
        }

        if ($request->hasFile('avatar')) {
            if ($me->avatar != "avatar-default.jpg") {
                Storage::delete('public/' . str_replace('/storage/', '', $me->avatar));
            }
            $image = $request->file('avatar');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = $image->storeAs('images',  $imageName, 'public');
            $data['avatar'] = '/storage/' . $imagePath;
        }
        $me->update($data);

        if ($request->filled('password')) {
            return response()->json([
                'message' => "Thay đổi mật khẩu thành công thành công!",
            ], 200);
        } else {
            return response()->json([
                'message' => "Cập nhập tài khoản cá nhân thành công!",
                'data' => $me
            ], 201);
        }
    }
    public function updateDoingExam(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,student_id',
            'doing_exam' => 'required|boolean',
            'time_remaining' => 'required|integer|min:0|max:3600', //2700s=45p 3600s=1h
        ], [
            'student_id.required' => 'Trường student_id là bắt buộc.',
            'student_id.exists' => 'Học sinh không tồn tại.',
            'doing_exam.required' => 'Trường doing_exam là bắt buộc.',
            'doing_exam.boolean' => 'Trường doing_exam phải là boolean (true hoặc false).',
            'time_remaining.min' => 'Trường time_remaining không được nhỏ hơn 0 giây.',
            'time_remaining.max' => 'Trường time_remaining không được lớn hơn 3600 giây.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $data = $request->only(['student_id', 'doing_exam', 'time_remaining']);

        if (!isset($data['student_id']) || !isset($data['doing_exam']) || !isset($data['time_remaining'])) {
            return response()->json(['status' => false, 'message' => 'Không có đủ dữ liệu được truyền!'], 400);
        }

        $student = student::find($data['student_id']);

        if (!$student) {
            return response()->json(['status' => false, 'message' => 'Học Sinh không tồn tại!'], 404);
        }

        $student->update([
            'doing_exam' => $data['doing_exam'],
            'time_remaining' => $data['time_remaining'],
            'starting_time' => now(),
        ]);

        return response()->json(['status' => true, 'message' => 'Cập Nhập thao tác Thi thành công!'], 200);
    }

    public function resetDoingExam(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,student_id',
            'doing_exam' => 'required|boolean',
            'time_remaining' => 'required|integer|min:0|max:3600', //2700s=45p 3600s=1h
        ], [
            'student_id.required' => 'Trường student_id là bắt buộc.',
            'student_id.exists' => 'Học sinh không tồn tại.',
            'doing_exam.required' => 'Trường doing_exam là bắt buộc.',
            'doing_exam.boolean' => 'Trường doing_exam phải là boolean (true hoặc false).',
            'time_remaining.min' => 'Trường time_remaining không được nhỏ hơn 0 giây.',
            'time_remaining.max' => 'Trường time_remaining không được lớn hơn 3600 giây.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $student = Student::find($request->input('student_id'));

        if (!$student) {
            return response()->json(['status' => false, 'message' => 'Học Sinh không tồn tại!'], 404);
        }

        $student->update([
            'doing_exam' => null,
            'time_remaining' => null,
            'starting_time' => null,
        ]);

        return response()->json(['status' => true, 'message' => 'Reset bài thi thành công!'], 200);
    }

    public function updateTiming(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,student_id',
            'min' => 'required|integer|min:0|max:59',
            'sec' => 'required|integer|min:0|max:59',
        ], [
            'student_id.required' => 'Trường student_id là bắt buộc.',
            'student_id.exists' => 'Học sinh không tồn tại.',
            'min.required' => 'Trường min là bắt buộc.',
            'min.min' => 'Trường min không được nhỏ hơn 0.',
            'min.max' => 'Trường min không được lớn hơn 59.',
            'sec.required' => 'Trường sec là bắt buộc.',
            'sec.min' => 'Trường sec không được nhỏ hơn 0.',
            'sec.max' => 'Trường sec không được lớn hơn 59.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $data = $request->only(['student_id', 'min', 'sec']);

        $student = Student::find($data['student_id']);

        if (!$student) {
            return response()->json(['status' => false, 'message' => 'Học Sinh không tồn tại!'], 404);
        }

        $time = $data['min'] . ':' . $data['sec'];
        $student->time_remaining = $time;
        $student->save();

        return response()->json(['status' => true, 'message' => 'Cập Nhập thời gian thi Thành công!'], 200);
    }

    public function getPractice(Request $request)
    {
        $user = $request->user('students');
        $grade_id = student::with("classes")->where("student_id", $user->student_id)->first()->classes->grade_id;
    $practice = practice::where("grade_id", $grade_id)->with("subject")
                ->whereNotIn('practice_code', function ($query) use ($user) {
                    $query->select('practice_code')
                          ->from('practice_scores')
                          ->where('student_id', $user->student_id);
                })
                ->orderBy('practice_code', 'desc')
                ->get();
    return response()->json(['data' => $practice], 200);
    }

    public function addTest(Request $request)
    {
        $student  = new student();
        $testCode = $request->test_code;
        $password = md5($request->password);
        $check  = $request->user('students');
        $id = $check->student_id;

        if ($password != $student->getTest($testCode)->password) {
            $result['status_value'] = "Sai mật khẩu";
            $result['status'] = 0;
        } else {
            $listQuest =  $student->getQuestOfTest($testCode);
            if ($listQuest !== null) {
                foreach ($listQuest as $quest) {
                    $array = array();
                    $array[0] = $quest->answer_a;
                    $array[1] = $quest->answer_b;
                    $array[2] = $quest->answer_c;
                    $array[3] = $quest->answer_d;
                    $ID = rand(1, time()) + rand(100000, 999999);
                    $time = $student->getTest($testCode)->time_to_do . ':00';
                    if (is_array($array) && count($array) >= 4) {
                        $student->addStudentQuest($id, $ID, $testCode, $quest->question_id, $array[0], $array[1], $array[2], $array[3]);
                    } else {
                        $result['status_value'] = "Không có đáp án";
                        $result['status'] = 0;
                    }
                    $student->updateStudentExam($id, $testCode, $time);
                }
                $result['status_value'] = "Thành công. Chuẩn bị chuyển trang!";
                $result['status'] = 1;
            } else {
                $result['status_value'] = "Không có câu hỏi cho bài kiểm tra này";
                $result['status'] = 0;
            }
        }


        return response()->json([
            'result' => $result,
        ]);
    }

    public function acceptTest(Request $request)
    {
        $student  = $request->user('students')->student_id;
        $doingExam = $request->user('students')->doing_exam;
        if (!$student) {
            return response()->json(['status' => false, 'message' => 'Học Sinh không tồn tại!'], 404);
        }
        $model = new student();
        $test = $model->getResultQuest($doingExam, $student);
        $testCode = $test->first()->test_code;
        $totalQuestions = $test->first()->total_questions;

        $correct = 0;
        $point = 10 / $totalQuestions;
        foreach ($test as $t) {
            if (trim($t->student_answer) == trim($t->correct_answer))
                $correct++;
        }
        $score = $correct * $point;
        $scoreDetail = $correct . '/' . $totalQuestions;
        $model->insertScore($student, $testCode, round($score, 2), $scoreDetail);
        $model->resetDoingExam($student);
        return response()->json(['status' => true, 'message' => 'Nộp bài Thành Công!'], 200);
    }
    /** Thực hiện nộp bài và tính điểm cho sinh viên */
    public function submitTest(Request $request)
    {
        $student  = $request->user('students');
        $test_code = $request->user('students')->doing_exam;
        // set doing_exam to null
        $student->doing_exam = null;
        $student->starting_time = null;
        $student->save();

        $total_question = tests::find($test_code)->total_questions;
        // check how many questions the student has answered is correct
        $correct  = student_test_detail::where('student_id', $student->student_id)
            ->where('test_code', $test_code)
            ->join('questions', 'student_test_detail.question_id', '=', 'questions.question_id')
            ->whereColumn('student_test_detail.student_answer', 'questions.correct_answer')
            ->count();
        // calculate the score
        $score = round($correct * 10 / $total_question, 2);
        // save the score to the scores table
        scores::create([
            'student_id' => $student->student_id,
            'test_code' => $test_code,
            'score_number' => $score,
            'score_detail' => $correct . '/' . $total_question,
            'completion_time' => now(),
        ]);

        return response()->json(['status' => $student, 'correct' => $correct, 'score' => $score]);

    }
    function submitPractice(Request $request){
        $student  = $request->user('students');
        $practice_code = $request->user('students')->doing_practice;
        // set doing_exam to null
        $student->doing_practice = null;
        $student->practice_starting_time = null;
        $student->save();

        $total_question = practice::find($practice_code)->total_questions;
        // check how many questions the student has answered is correct
        $correct  = student_practice_detail::where('student_id', $student->student_id)
            ->where('practice_code', $practice_code)
            ->join('questions', 'student_practice_detail.question_id', '=', 'questions.question_id')
            ->whereColumn('student_practice_detail.student_answer', 'questions.correct_answer')
            ->count();
        // calculate the score
        $score = round($correct * 10 / $total_question,2);
        // save the score to the scores table
        practice_scores::create([
            'student_id' => $student->student_id,
            'practice_code' => $practice_code,
            'score_number' => $score,
            'score_detail' => $correct . '/' . $total_question,
            'completion_time' => now(),
        ]);

        return response()->json(['status' => $student, 'correct' => $correct, 'score' => $score]);
    }


    public function showResult(Request $request)
    {
        $student  = $request->user('students');
        if ($student->doing_exam == '') {
            $testCode = $request->test_code;
            $score = scores::where('student_id', $student->student_id)
                ->where('test_code', $testCode)
                ->first();

            $result = DB::table('student_test_detail')
                ->join('questions', 'student_test_detail.question_id', '=', 'questions.question_id')
                ->join('tests', 'student_test_detail.test_code', '=', 'tests.test_code')
                ->where('student_test_detail.test_code', $testCode)
                ->where('student_test_detail.student_id', $student->student_id)
                ->orderBy('student_test_detail.ID')
                ->get();

            if ($score && $result->isNotEmpty()) {
                return response()->json([
                    'status' => true,
                    'data' => [
                        'score' => $score,
                        'result' => $result,
                    ],
                    'message' => 'Lấy điểm thi thành công!',
                ], 200);
            } else {
                return response()->json(['status' => false, 'message' => 'Không tìm thấy điểm hoặc kết quả!'], 404);
            }
        }
    }
    /** Thực hiện update cho current student set doing exam to test_code comming from request
     * @param $test_code
     */
    public function beginDoingTest(Request $request)
    {
        $student = student::find($request->user('students')->student_id);
        $testCode = $request->test_code;
        // check if the student is not doing any exam
        $afterUpdate = null;
        if( $student->doing_exam == null){
            $afterUpdate =$student->update([
                'doing_exam' => $testCode,
                'starting_time' => now(),
            ]);
        }
        return response()->json([ 'student' => $afterUpdate]);

    }
    public function startDoingPractice( Request $request){
        $student = student::find( $request->user('students')->student_id );
        $practiceCode = $request->practice_code;
        // check if the student is not doing any exam
        $afterUpdate = null;
        if( $student->doing_exam == null){
            $afterUpdate =$student->update([
                'doing_practice' => $practiceCode,
                'practice_starting_time' => now(),
            ]);
        }
        return response()->json([ 'student' => $afterUpdate]);
    }

    public function updateAnswer(Request $request)
    {
        // perform udpate student answer in student_test_detail table
        $question_id = $request->question_id;
        $student_id    = $request->user('students')->student_id;
        $testCode     = $request->user('students')->doing_exam;
        $student_answer     = $request->student_answer;
        // now our mission is to update the student answer
        // first check if the question_id exists in the student_test_detail table
        $student_test_detail = student_test_detail::where('question_id', $question_id)
            ->where('student_id', $student_id)
            ->where('test_code', $testCode)
            ->first();

        if ($student_test_detail) {
            // update the student answer
            $sql = "UPDATE student_test_detail
        SET student_answer = ?
        WHERE student_id = ? AND test_code = ? AND question_id = ?";
            DB::update($sql, [$student_answer, $student_id, $testCode, $question_id]);
            return response()->json(["message" => "thuc hien update record"]);
        } else {
            // insert the student answer
            student_test_detail::create([
                'ID' => Uuid::uuid4()->toString(),
                'student_id' => $student_id,
                'test_code' => $testCode,
                'question_id' => $question_id,
                'student_answer' => $student_answer,
            ]);
            return response()->json(["message"=>"thuc hien create record"]);
        }
    }
    function updatePraceticeAnswer (Request $request){
        $question_id = $request->question_id;
        $student_id    = $request->user('students')->student_id;
        $practiceCode     = $request->user('students')->doing_practice;
        $student_answer     = $request->student_answer;
        $student_practice_detail = student_practice_detail::where('question_id', $question_id)
            ->where('student_id', $student_id)
            ->where('practice_code', $practiceCode)
            ->first();

        if ($student_practice_detail) {
            // update the student answer
        $sql = "UPDATE student_practice_detail
        SET student_answer = ?
        WHERE student_id = ? AND practice_code = ? AND question_id = ?";
        DB::update($sql, [$student_answer, $student_id, $practiceCode, $question_id]);
            return response()->json(["message"=>"update answer"]);
        } else {
            // insert the student answer
            student_practice_detail::create([
                'ID' => Uuid::uuid4()->toString(),
                'student_id' => $student_id,
                'practice_code' => $practiceCode,
                'question_id' => $question_id,
                'student_answer' => $student_answer,
            ]);
            return response()->json(["message"=>"create new answer"]);
        }
    }
    //danh sách thông báo
    public function notifications(Request $request)
    {
        $classId = $request->user("students")->class_id;
        $notifications = notifications::whereIn('notification_id', function ($query) use ($classId) {
                $query->select('notification_id')
                    ->from('student_notifications')
                    ->where('class_id', $classId);
            })
            ->get();

        return response()->json(['data' => $notifications]);
    }

    public function getChat(Request $request)
    {
        $classId = $request->user("students")->class_id;
        $data = chats::where('class_id', $classId)
            ->orderBy('id', 'DESC')
             ->limit(10)
            ->get();
        return response()->json(['data' => $data]);
    }
    public function getAllChat(Request $request)
    {
        $classId = $request->user("students")->class_id;
        $data = chats::where('class_id', $classId)
            ->orderBy('id', 'DESC')
            ->get();
        return response()->json(['data' => $data]);
    }
    public function sendChat(Request $request)
    {
        $student = $request->user('students');
        if (!$student) {
            return response()->json([
                'status' => false,
                'message' => 'Học sinh không tồn tại!',
            ], 403);
        }
        $validator = Validator::make($request->all(), [
            'chat_content' => 'required|string',
        ], [
            'chat_content.required' => 'Vui lòng nhập nội dung chat!',
            'chat_content.unique' => 'Nội dung chat đã được gửi!',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $chat = Chats::create([
            'username' => $student->username,
            'name' => $student->name,
            'class_id' => $student->class_id,
            'chat_content' => $request->chat_content,
            'time_sent' => Carbon::now('Asia/Ho_Chi_Minh'),
        ]);

        broadcast(new MessageSent($chat))->toOthers();

        return response()->json([
            'message' => "Gửi tin nhắn thành công!",
            'data' => $chat,
        ], 200);
    }

    public function unSent(Request $request)
    {
        $student = $request->user('students');
        if (!$student) {
            return response()->json([
                'status' => false,
                'message' => 'Học sinh không tồn tại!',
            ], 403);
        }

        $validator = Validator::make($request->all(), [
            'ID' => 'required|exists:chats,ID',
        ], [
            'ID.required' => 'Trường ID là bắt buộc!',
            'ID.exists' => 'Đoạn chat không tồn tại!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $chat = Chats::where('username', $student->username)->where('ID', $request->ID)->first();
        if ($chat) {
            $classId = $chat->class_id;
            $chat->delete();

            broadcast(new MessageUnsent($chat->ID, $classId))->toOthers();

            return response()->json([
                'status' => true,
                'message' => 'Thu hồi tin nhắn thành công!',
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Tin nhắn không tồn tại hoặc không có quyền thu hồi!',
            ], 400);
        }
    }

    public function editChat(Request $request)
    {
        $student = $request->user('students');
        if (!$student) {
            return response()->json([
                'status' => false,
                'message' => 'Học sinh không tồn tại!',
            ], 403);
        }

        $validator = Validator::make($request->all(), [
            'chat_content' => 'required|string',
        ], [
            'chat_content.required' => 'Vui lòng nhập nội dung chat!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $chat = Chats::where('username', $student->username)->where('ID', $request->ID)->first();
        if ($chat) {
            $chat->chat_content = $request->chat_content;
            $chat->save();

            broadcast(new MessageEdited($chat->ID, $chat->class_id, $chat->chat_content))->toOthers();

            return response()->json([
                'status' => true,
                'message' => 'Sửa tin nhắn thành công!',
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Tin nhắn không tồn tại hoặc không có quyền sửa!',
            ], 400);
        }
    }
}
