<?php

namespace App\Http\Controllers;

use App\Models\classes;
use App\Models\notifications;
use App\Models\practice;
use App\Models\quest_of_practice;
use App\Models\quest_of_test;
use App\Models\questions;
use App\Models\scores;
use App\Models\student;
use App\Models\student_notifications;
use App\Models\students;
use App\Models\teacher;
use App\Models\tests;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Illuminate\Support\Facades\Validator;

class TeacherConTroller extends Controller
{
    public function searchOfTest(Request $request)
    {
        $keySearch = $request->key_search;

        $data = tests::where('test_code', 'like', '%' . $keySearch . '%')
            ->orWhere('test_name', 'like', '%' . $keySearch . '%')
            ->orWhere('subject_id', 'like', '%' . $keySearch . '%')
            ->orWhere('grade_id', 'like', '%' . $keySearch . '%')
            ->orWhere('level_id', 'like', '%' . $keySearch . '%')
            ->orWhere('note', 'like', '%' . $keySearch . '%')
            ->get();

        return response()->json([
            'data' => $data
        ]);
    }
    public function searchOfTeacher(Request $request)
    {
        $keySearch = $request->key_search;

        $data = questions::where('question_content', 'like', '%' . $keySearch . '%')
            ->orWhere('answer_a', 'like', '%' . $keySearch . '%')
            ->orWhere('answer_b', 'like', '%' . $keySearch . '%')
            ->orWhere('answer_c', 'like', '%' . $keySearch . '%')
            ->orWhere('answer_d', 'like', '%' . $keySearch . '%')
            ->orWhere('suggest', 'like', '%' . $keySearch . '%')
            ->get();

        return response()->json([
            'data'  => $data
        ]);
    }
    public function getResultClass(Request $request, $test_code)
    {
        $teacherId = $request->user('teachers')->teacher_id;
        $classId = classes::where('teacher_id', $teacherId)->pluck('class_id');
        $show = tests::join('scores', 'tests.test_code', '=', 'scores.test_code')
            ->join('students', 'scores.student_id', '=', 'students.student_id')
            ->join('classes', 'students.class_id', '=', 'classes.class_id')
            ->whereIn('students.class_id', $classId)
            ->where('tests.test_code', $test_code)

            //->select('tests.test_code', 'tests.test_name', 'tests.subject_id', 'tests.grade_id', 'tests.level_id', 'tests.note', 'scores.score_number', 'scores.completion_time')
            ->get();
        return response()->json([
            'message' => 'Dữ liệu kết quả bài test của học sinh trong lớp',
            'data' => $show
        ], 200);
    }
    public function getInfo(Request $request)
    {
        $username = $request->user('teachers')->username;
        $me = teacher::select('teachers.teacher_id', 'teachers.username', 'teachers.avatar', 'teachers.email', 'teachers.name', 'teachers.last_login', 'teachers.birthday', 'permissions.permission_detail', 'genders.gender_detail', 'genders.gender_id')
            ->join('permissions', 'teachers.permission', '=', 'permissions.permission')
            ->join('genders', 'teachers.gender_id', '=', 'genders.gender_id')
            ->where('teachers.username', '=', $username)
            ->first();

        return response()->json([
            'message' => 'Lấy thông tin cá nhân thành công!',
            'data' => $me
        ], 200);
    }
    public function updateProfile(Request $request)
    {
        $me = $request->user('teachers');
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
            $imagePath = $image->storeAs('images', $imageName, 'public');
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

    public function getStudent(Request $request)
    {
        $user = $request->user('teachers');
        $students = students::join('classes', 'students.class_id', '=', 'classes.class_id')
            ->where('classes.teacher_id', $user->teacher_id)
            ->select("name", "username", 'email', "students.student_id", "students.class_id", "students.birthday", "avatar")
            ->get();
        return response()->json([
            'message' => 'Lấy dữ liệu Lớp thành công!',
            'data' => $students
        ], 200);
    }
    public function detailStudent(Request $request)
    {
        $user = $request->user('teachers');

        $studentId = $request->student_id;

        // Kiểm tra student_id có tồn tại không và có đúng định dạng không
        if (!is_numeric($studentId)) {
            return response()->json([
                'status' => false,
                'message' => 'student_id phải là một số nguyên dương!',
            ], 422);
        }

        // Lấy thông tin học sinh, bao gồm thông tin lớp và kết quả test
        $student = Student::with(['class', 'scores.test'])
            ->whereHas('classes', function ($query) use ($user) {
                $query->where('teacher_id', $user->teacher_id);
            })
            ->where('student_id', $studentId)
            ->select("name", "username", 'email', "student_id", "class_id", "birthday", "avatar")
            ->first();

        // Kiểm tra nếu không tìm thấy học sinh
        if (!$student) {
            return response()->json([
                'status' => false,
                'message' => 'Học sinh không tồn tại trong lớp của giáo viên',
            ], 404);
        }

        if (!$student->scores) {
            return response()->json([
                'status' => false,
                'message' => 'Không có kết quả test cho học sinh này',
            ], 404);
        }

        // Xử lý thông tin kết quả test
        $scores = collect($student->scores);
        $practiceCount = $scores->count();
        $testResults = $scores->map(function ($score) {
            return [
                'test_code' => $score->test_code,
                'test_name' => $score->test->test_name,
                'score_number' => $score->score_number,
                'score_detail' => $score->score_detail,
                'completion_time' => $score->completion_time,
            ];
        });

        return response()->json([
            'status' => true,
            'message' => 'Lấy thông tin học sinh thành công',
            'data' => [
                'student' => $student,
                'practice_count' => $practiceCount,
                'test_results' => $testResults
            ]
        ], 200);
    }
    public function getClass(Request $request)
    {
        $user = $request->user('teachers');
        $classes = classes::with('teacher')->where('teacher_id', $user->teacher_id)->get();

        return response()->json([
            'message'   => 'Lấy dữ liệu lớp thành công!',
            'data'      => $classes
        ], 200);
    }
    public function getStudentOfClass(Request $request, $class_id)
    {
        $students = students::where('class_id', $class_id)->get();

        return response()->json([
            'message'   => 'Lấy dữ liệu lớp thành công!',
            'data'      => $students
        ], 200);
    }
    public function getScore(Request $request)
    {
        $teacherId = $request->user('teachers')->teacher_id;
        $student_id = $request->student_id;

        $validator = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,student_id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'    => false,
                'message'   => 'Học sinh không tồn tại!',
                'errors'    => $validator->errors(),
            ], 422);
        }

        // Lấy danh sách class_id mà giáo viên giảng dạy
        $classIds = Classes::where('teacher_id', $teacherId)->pluck('class_id');

        // Lấy dữ liệu điểm của học sinh trong các lớp mà giáo viên đang giảng dạy
        $scoreData = Scores::join('students', 'scores.student_id', '=', 'students.student_id')
            ->join('classes', 'students.class_id', '=', 'classes.class_id')
            ->join('tests', 'scores.test_code', '=', 'tests.test_code')
            ->where('scores.student_id', $student_id)
            ->whereIn('classes.class_id', $classIds)
            ->select(
                'scores.student_id',
                'scores.test_code',
                'scores.score_number',
                'scores.score_detail',
                'scores.completion_time',
                'tests.test_name'
            )
            ->orderBy('scores.completion_time', 'desc')
            ->get();

        return response()->json([
            'message'   => 'Lấy điểm của học sinh thành công!',
            'data'      => $scoreData,
        ], 200);
    }
    //xuất file điểm
    public function exportScore(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'test_code' => 'required|string|max:255',
        ], [
            'test_code.required' => 'Mã bài thi không được để trống!',
            'test_code.max' => 'Mã bài thi không quá 255 kí tự!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $test_code = $request->input('test_code', '');

        $sql = "SELECT * FROM `scores` INNER JOIN students ON scores.student_id = students.student_id
            INNER JOIN classes ON students.class_id = classes.class_id
            WHERE test_code = ?";

        $scores = DB::select($sql, [$test_code]);

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setCellValue('A1', 'Danh Sách Điểm Bài Thi ' . $test_code);
        $sheet->setCellValue('A3', 'STT');
        $sheet->setCellValue('B3', 'Tên');
        $sheet->setCellValue('C3', 'Tài Khoản');
        $sheet->setCellValue('D3', 'Lớp');
        $sheet->setCellValue('E3', 'Điểm');

        foreach ($scores as $key => $score) {
            $row = $key + 4;
            $sheet->setCellValue('A' . $row, $key + 1);
            $sheet->setCellValue('B' . $row, $score->name);
            $sheet->setCellValue('C' . $row, $score->username);
            $sheet->setCellValue('D' . $row, $score->class_name);
            $sheet->setCellValue('E' . $row, $score->score_number);
        }

        // signature
        $lastRow = count($scores) + 5;
        $sheet->setCellValue('B' . $lastRow, 'Chữ kí giám thị 1');
        $sheet->setCellValue('E' . $lastRow, 'Chữ kí giám thị 2');

        // export to excel
        $writer = new Xlsx($spreadsheet);
        $filename = 'danh-sach-diem-' . $test_code . '.xlsx';
        $tempFilePath = tempnam(sys_get_temp_dir(), 'export_score_');
        $writer->save($tempFilePath);

        return response()->download($tempFilePath, $filename)->deleteFileAfterSend(true);
    }

    public function addQuestion(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'grade_id' => 'required|integer',
            'level_id' => 'required|integer',
            'question_content' => 'required|string',
            'answer_a' => 'required|string',
            'answer_b' => 'required|string',
            'answer_c' => 'required|string',
            'answer_d' => 'required|string',
            'correct_answer' => 'required|string',
            'suggest' => 'nullable|string',
        ], [
            'grade_id.required' => 'Vui lòng chọn mức độ học.',
            'level_id.required' => 'Vui lòng chọn cấp độ.',
            'question_content.required' => 'Vui lòng nhập nội dung câu hỏi.',
            'answer_a.required' => 'Vui lòng nhập đáp án A.',
            'answer_b.required' => 'Vui lòng nhập đáp án B.',
            'answer_c.required' => 'Vui lòng nhập đáp án C.',
            'answer_d.required' => 'Vui lòng nhập đáp án D.',
            'correct_answer.required' => 'Vui lòng chọn đáp án đúng.',
            'subject_id.required' => 'Vui lòng chọn môn học.',
            'status_id.required' => 'Vui lòng chọn trạng thái.',
            'suggest.string' => 'Gợi ý phải là chuỗi.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $teacher = $request->user('teachers');

        $data = $request->all();
        $data['teacher_id'] = $teacher->teacher_id;
        $data['subject_id'] = $teacher->subject_id;
        $data['status_id'] = 3;

        //up ảnh cho câu hỏi và mỗi đáp án
        $multimedia = $request->file('multimedia');
        if ($multimedia) {
            $filename = time() . '.' . $multimedia->getClientOriginalExtension();
            $multimedia->move(public_path('uploads'), $filename);
            $data['multimedia'] = $filename;
        }
        $question = questions::create($data);

        return response()->json(["data" => $question]);
    }

    public function addQuestionTwo(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question_content' => 'required|string',
            'answer_is_true'=> 'required|string',
            'answer_is_false'=> 'required|string',
            'correct_answer' => 'required|string',
            'suggest' => 'nullable|string',
        ], [
            'question_id.required' => 'Vui lòng nhập ID câu hỏi.',
            'question_content.required' => 'Vui lòng nhập nội dung câu hỏi.',
            'answer_is_true.required' => 'Vui lòng nhập đáp án thứ nhất.',
            'answer_is_false.required' => 'vui lòng nhập đáp án thứ hai.',
            'correct_answer.required' => 'Vui lòng chọn đáp án đúng.',
            ]
        );
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $teacher = $request->user('teachers');
        $data = $request->all();
        $data['teacher_id'] = $teacher->teacher_id;
        $data['subject_id'] = $teacher->subject_id;
        $data['status_id'] = 3;
        //như trên
        $multimedia = $request->file('multimedia');
        if ($multimedia) {
            $filename = time() . '.' . $multimedia->getClientOriginalExtension();
            $multimedia->move(public_path('uploads'), $filename);
            $data['multimedia'] = $filename;
        }
        $question = questions::create($data);
        return response()->json([
            'data' => $question,
            'message' => 'Thêm câu hỏi thành công!'

        ], 200);

    }
    public function addFileQuestion(Request $request)
    {
        $teacher_id = $request->user('teachers')->teacher_id;
        $validator = Validator::make($request->all(), [
            'file' => 'required|file|mimes:xlsx',
        ], [
            'file.required'                => 'Vui lòng chọn tệp để tiếp tục!',
            'file.mimes'                   => 'File phải là xlsx!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $result = [];

        $subjectId = $request->user('teachers')->subject_id;
        $inputFileType = 'Xlsx';
        $count = 0;
        $errList = [];

        if ($request->hasFile('file')) {
            $filePath = $request->file('file')->path();

            $reader = IOFactory::createReader($inputFileType);
            $spreadsheet = $reader->load($filePath);
            $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);

            foreach ($sheetData as $key => $row) {
                if ($key < 4 || empty($row['A'])) {
                    continue;
                }

                $stt = $row['A'];
                $questionContent = $row['B'];
                $levelId = $row['C'];
                $answerA = $row['D'];
                $answerB = $row['E'];
                $answerC = $row['F'];
                $answerD = $row['G'];
                $correctAnswer = $row['H'];
                $gradeId = $row['I'];
                $unit = $row['J'];
                $suggest = $row['K'];
                if (!empty($questionContent)) {
                    $question = new questions([
                        'subject_id' => $subjectId,
                        'question_content' => $questionContent,
                        'level_id' => $levelId,
                        'answer_a' => $answerA,
                        'answer_b' => $answerB,
                        'answer_c' => $answerC,
                        'answer_d' => $answerD,
                        'correct_answer' => $correctAnswer,
                        'grade_id' => $gradeId,
                        'unit' => $unit,
                        'suggest' => $suggest,
                        'status_id' => 1,
                        'teacher_id' => $teacher_id,
                    ]);

                    // Lưu câu hỏi vào cơ sở dữ liệu
                    if ($question->saveQuietly()) {
                        $count++;
                    } else {
                        $errList[] = $stt;
                    }
                }
            }

            unlink($filePath);

            if (empty($errList)) {
                $result['status_value'] = "Thêm thành công " . $count . " câu hỏi!";
                $result['status'] = 1;
            } else {
                $result['status_value'] = "Lỗi! Không thể thêm câu hỏi có STT: " . implode(', ', $errList) . ', vui lòng xem lại.';
                $result['status'] = 0;
            }
        } else {
            $result['status_value'] = "Không tìm thấy tệp được tải lên!";
            $result['status'] = 0;
        }
        return response()->json($result);
    }

    public function destroyQuestion(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question_id' => 'required|integer|exists:questions,question_id',
        ], [
            'question_id.required' => 'Câu hỏi chưa đúng ID!',
            'question_id.exists' => 'Câu hỏi không tồn tại!',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ], 422);
        }
        $question = questions::find($request->question_id);

        if (!$question) {
            return response()->json([
                'status' => false,
                'message' => 'Câu hỏi không tồn tại!'
            ]);
        }
        try {
            $question->delete();

            return response()->json([
                'status' => true,
                'message' => 'Xóa câu hỏi thành công!'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Câu hỏi đang tồn tại ở ngân hàng câu hỏi!',
                'data' => $e
            ]);
        }
    }

    public function updateQuestion(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question_id' => 'required|integer|exists:questions,question_id',
            'question_content' => 'nullable|string',
            'level_id' => 'required|nullable|integer|exists:levels,level_id',
            'answer_a' => 'nullable|string',
            'answer_b' => 'nullable|string',
            'answer_c' => 'nullable|string',
            'answer_d' => 'nullable|string',
            'correct_answer' => 'nullable',
            'grade_id' => 'nullable|integer|exists:grades,grade_id',
            'suggest' => 'nullable|string',
            'status_id' => 'nullable|integer|in:1,2,3',
        ], [
            'question_id.required' => 'ID câu hỏi là bắt buộc!',
            'question_id.exists' => 'Không tìm thấy câu hỏi với ID đã chọn!',
            'level_id.exists' => 'Không tìm thấy level với ID đã chọn!',
            'level_id.required' => 'Level bắt buộc!',
            'grade_id.exists' => 'Không tìm thấy grade với ID đã chọn!',
            'status_id.in' => 'Cấp độ không được để trống!',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $question = questions::find($request->question_id);

        $question->update($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Cập nhật câu hỏi thành công!',
        ], 200);
    }
    public function getQuestion(Request $request)
    {
        $user = $request->user('teachers');
        $questions = questions::where('subject_id', $user->subject_id)->orderBy('question_id', 'desc')->get();
        return response()->json(["data" => $questions]);
    }
    public function getTotalQuestions(Request $request)
    {
        $user = $request->user('teachers');
        $numQuestion = DB::table('questions')
            ->select(DB::raw('count(question_id) as total_question, level_id, subject_id'))
            ->where('subject_id', $user->subject_id)
            ->groupBy('subject_id', 'level_id')
            ->get();

        return response()->json(["data" => $numQuestion]);
    }

    public function multiDeleteQuestion(Request $request, $question_ids)
    {
        try {
            DB::beginTransaction();

            questions::whereIn('question_id', $question_ids)->delete();

            DB::commit();

            return true;
        } catch (\Exception $e) {
            DB::rollBack();
            return false;
        }
    }
    /**
     * 1. Giáo viên môn nào thì chỉ xem được để của môn đó
     */
    public function getTest(Request $request)
    {
        // teacher môn nào chỉ có thể xem test của môn đó
        $subjectId = $request->user('teachers')->subject_id;
        $teacherId = $request->user('teachers')->teacher_id;
        $data  = tests::with('subject')
            ->where('subject_id', $subjectId)
            ->where('tests.teacher_id', $teacherId)
            ->orderBy('timest', 'desc')
            ->get();
        return response()->json(["data" => $data]);
    }
    public function getPractice(Request $request)
    {
        // teacher môn nào chỉ có thể xem test của môn đó
        $subjectId = $request->user('teachers')->subject_id;
        $teacherId = $request->user('teachers')->teacher_id;
        $data  = practice::with('subject')
            ->where('subject_id', $subjectId)
            ->where('practice.teacher_id', $teacherId)
            ->get();
        return response()->json(["data" => $data]);
    }
    /**
     * Xem chi tiết đề thi
     */
    public function getTestDetail(Request $request, $test_code)
    {
        // teacher môn nào chỉ có thể xem test của môn đó
        $questions = [];
        $data = tests::find($test_code);
        if (!$data)
            return response()->json(["message" => "Không tìm thấy đề thi!"], 400);
        foreach ($data->questions as $question) {
            $questions[] = $question;
        }
        $data['questions'] = $questions;

        return response()->json(["data" => $data]);
    }
    public function getPracticeDetail(Request $request, $practice_code)
    {
        $questions = [];
        $data = practice::find($practice_code);
        foreach ($data->questions as $question) {
            $questions[] = $question;
        }
        $data['questions'] = $questions;

        return response()->json(["data" => $data]);
    }
    /**
     * 1. Chỉ delete những đề chưa duyệt, và đề nào đã duyệt rồi thi không xóa được
     * 2. Chỉ delete những đề của môn học mà giáo viên đó dạy
     */
    public function deleteTest(Request $request, $test_code)
    {
        $id = $request->user('teachers');
        $test = tests::find($test_code);

        // kiểm tra xem đề thi có tồn tại không
        if (!$test)
            return response()->json(["message" => "Không tìm thấy đề thi!"], 400);

        // kiểm tra xem đề thi có phải của môn học mà giáo viên dạy không
        if ($test->subject_id != $id->subject_id)
            return response()->json(["message" => "Đề thi không phải của môn học mà giáo viên dạy!"], 400);

        // kiểm tra xem đề thi đã duyệt chưa
        if ($test->status_id != 3)
            return response()->json(["message" => "Đề thi đã duyệt không thể xóa!"], 400);
        $test->delete();
        return response()->json(["message" => "Xóa thành công đề thi", "data" => $test]);
    }
    /**
     * 1. Chỉ update những đề chưa duyệt, và đề nào đã duyệt rồi thi không update được
     * 2. Chỉ update những đề của môn học mà giáo viên đó dạy
     * 3. Số lượng câu hỏi sẽ không thay đổi được tại vì khi tạo đề từ số lượng câu hỏi sẽ sinh ra chi tiết đề
     * 4. Khi update đề thì chỉ update được password của đề thi, thời gian làm bài, ghi chú, tên đề thi
     */
    public function updateTest(Request $request, $test_code)
    {
        $validator = Validator::make($request->all(), [
            'time_to_do' => 'sometimes|numeric|min:15|max:120',
            'password' => 'sometimes|string|min:6|max:20',
            'note' => 'sometimes|string',
        ], [
            'teacher_id.exists' => 'Không tìm thấy Giáo viên!',
            'subject_id.exists' => 'Không tìm thấy Môn học!',
            'time_to_do.min' => 'Thời gian tối thiểu 15 phút!',
            'password.min' => 'Password tối thiểu 6 kí tự!',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }
        $data = $request->all();
        if ($request->password)
            $data['password'] = bcrypt($request->password);
        $test = tests::find($test_code)
            ->update($data);

        return response()->json([
            'message' => 'Cập nhật đề thi thành công!',
            "data" => $test
        ]);
    }

    /**
     * Tạo đề tự động số câu hỏi sẽ được lấy ngẫu nhiên từ ngân hàng câu hỏi, dựa theo môn học, khối học, cấp độ
     */
    public function createTest(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'test_name' => 'string|unique:tests,test_name',
            'total_questions' => 'integer|min:10|max:100',
            'grade_id' => 'integer|exists:grades,grade_id',
            'level_id' => 'required|integer|exists:levels,level_id',
            'time_to_do' => 'required|numeric|min:10|max:120',
            'chapters' => 'required|array',
            'chapters.*.id' => 'required|integer|exists:chapters,id',
            'chapters.*.num_questions' => 'required|integer|min:1',
        ], [
            'test_name.unique' => 'Tên đề không nên trùng nhau!',
            'grade_id.exists' => 'Không tìm thấy Lớp!',
            'total_questions.min' => 'Tối thiểu 10 câu hỏi trong đề!',
            'level_id.required' => 'Level_id là bắt buộc!',
            'time_to_do.min' => 'Thời gian làm bài tối thiếu là 10 phút!',
            'chapters.required' => 'Phải chọn ít nhất một chương!',
            'chapters.*.id.exists' => 'Không tìm thấy chương!',
            'chapters.*.num_questions.min' => 'Số lượng câu hỏi cho mỗi chương phải ít nhất là 1!',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $user = $request->user('teachers');
        $chapters = $request->chapters;
        foreach ($chapters as $chapter) {
            if (!is_array($chapter)) {
                return response()->json(["message" => "Chương không hợp lệ!"], 400);
            }

            $numQuestionsInChapter = questions::where('subject_id', $user->subject_id)
            ->where('grade_id', $request->grade_id)
            ->where('level_id', $request->level_id)
            ->where('chapter_id', $chapter['id'])
            ->count();
            if ($numQuestionsInChapter < $chapter['num_questions']) {
                return response()->json([
                    "message" => "Số lượng câu hỏi trong chương " . $chapter['id'] . " không đủ! Có " . $numQuestionsInChapter . " câu hỏi trong chương này."
                ], 400);
            }
        }

        DB::beginTransaction();
        try {
            $test_code = time();
            $data = $request->all();
            $test = array_merge($data, [
                'test_code' => $test_code,
                'subject_id' => $user->subject_id,
                'status_id' => 3,
                'teacher_id' => $user->teacher_id,
            ]);

            $testCreate = tests::create($test);

            foreach ($chapters as $chapter) {
                $questions = questions::where('subject_id', $user->subject_id)
                    ->where('grade_id', $request->grade_id)
                    ->where('level_id', $request->level_id)
                    ->where('chapter_id', $chapter['id'])
                    ->inRandomOrder()
                    ->limit($chapter['num_questions'])
                    ->get('question_id');

                foreach ($questions as $question) {
                    quest_of_test::create(['test_code' => $test_code, 'question_id' => $question->question_id]);
                }
            }

            DB::commit();
            return response()->json([
                'message' => "Tạo đề thi thành công!",
                "test" => $testCreate
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(["message" => "Tạo đề thi thất bại!", "error" => $e->getMessage()], 400);
        }
    }
    public function createPractice(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'practice_name' => 'sometimes|string|unique:practice,practice_name',
            'total_questions' => 'integer|min:10|max:50',
            'grade_id' => 'integer|exists:grades,grade_id',
            'level_id' => 'required|integer|exists:levels,level_id',
            'time_to_do' => 'required|numeric|min:10|max:120',
            'chapters' => 'required|array',
            'chapters.*.chapter_id' => 'required|integer|exists:chapters,id',
            'chapters.*.num_questions' => 'required|integer|min:1',
        ], [
            'practice_name.unique' => 'Tên đề không nên trùng nhau!',
            'grade_id.exists' => 'Không tìm thấy Lớp!',
            'total_questions.min' => 'Tối thiểu 10 câu hỏi trong đề!',
            'level_id.required' => 'Level_id là bắt buộc!',
            'time_to_do.min' => 'Thời gian làm bài tối thiếu là 10 phút!',
            'chapters.required' => 'Phải chọn ít nhất một chương!',
            'chapters.*.chapter_id.required' => 'Chương ID là bắt buộc!',
            'chapters.*.chapter_id.exists' => 'Không tìm thấy chương!',
            'chapters.*.num_questions.required' => 'Số lượng câu hỏi cho chương là bắt buộc!',
            'chapters.*.num_questions.min' => 'Số lượng câu hỏi cho mỗi chương phải ít nhất là 1!',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $user = $request->user('teachers');

        $chapters = $request->chapters;
        foreach ($chapters as $chapter) {
            $numQuestionsInChapter = questions::where('subject_id', $user->subject_id)
                ->where('.grade_id', $request->grade_id)
                ->where('level_id', $request->level_id)
                ->where('chapters.id', $chapter['chapter_id'])
                ->count();

            if ($numQuestionsInChapter < $chapter['num_questions']) {
                return response()->json([
                    "message" => "Số lượng câu hỏi trong chương " . $chapter['chapter_id'] . " không đủ! Có " . $numQuestionsInChapter . " câu hỏi trong chương này."
                ], 400);
            }
        }

        DB::beginTransaction();
        try {
            $practice_code = time();
            $data = $request->all();
            $practice = array_merge($data, [
                'practice_code' => $practice_code,
                'subject_id' => $user->subject_id,
                'status_id' => 3,
                'teacher_id' => $user->teacher_id,
            ]);

            $practiceCreate = Practice::create($practice);

            foreach ($chapters as $chapter) {
                $questions = questions::join('chapters', 'questions.chapter_id', '=', 'chapters.id')
                    ->where('questions.subject_id', $user->subject_id)
                    ->where('questions.grade_id', $request->grade_id)
                    ->where('questions.level_id', $request->level_id)
                    ->where('chapters.id', $chapter['chapter_id'])
                    ->inRandomOrder()
                    ->limit($chapter['num_questions'])
                    ->get('question_id');

                foreach ($questions as $question) {
                    quest_of_practice::create(['practice_code' => $practice_code, 'question_id' => $question->question_id]);
                }
            }

            DB::commit();
            return response()->json([
                'message' => "Tạo bài tập thành công!",
                "practice" => $practiceCreate
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(["message" => "Tạo bài tập thất bại!", "error" => $e->getMessage()], 400);
        }
    }


    public function addFileTest(Request $request)
    {
        $teacher_id = $request->user('teachers')->teacher_id;
        $validator = Validator::make($request->all(), [
            'file' => 'required|file|mimes:xlsx',
        ], [
            'file.required'                => 'Vui lòng chọn tệp để tiếp tục!',
            'file.mimes'                   => 'File phải là xlsx!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $result = [];

        $subjectId = $request->subject_id;
        $inputFileType = 'Xlsx';
        $count = 0;
        $errList = [];

        if ($request->hasFile('file')) {
            $filePath = $request->file('file')->path();

            $reader = IOFactory::createReader($inputFileType);
            $spreadsheet = $reader->load($filePath);
            $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);

            foreach ($sheetData as $key => $row) {
                if ($key < 4 || empty($row['A'])) {
                    continue;
                }

                $stt = $row['A'];
                $questionContent = $row['B'];
                $levelId = $row['C'];
                $answerA = $row['D'];
                $answerB = $row['E'];
                $answerC = $row['F'];
                $answerD = $row['G'];
                $correctAnswer = $row['H'];
                $gradeId = $row['I'];
                $unit = $row['J'];
                $suggest = $row['K'];
                if (!empty($questionContent)) {
                    $question = new questions([
                        'subject_id' => $subjectId,
                        'question_content' => $questionContent,
                        'level_id' => $levelId,
                        'answer_a' => $answerA,
                        'answer_b' => $answerB,
                        'answer_c' => $answerC,
                        'answer_d' => $answerD,
                        'correct_answer' => $correctAnswer,
                        'grade_id' => $gradeId,
                        'unit' => $unit,
                        'suggest' => $suggest,
                        'status_id' => 3,
                        'teacher_id' => $teacher_id,
                    ]);

                    // Lưu câu hỏi vào cơ sở dữ liệu
                    if ($question->saveQuietly()) {
                        $count++;
                    } else {
                        $errList[] = $stt;
                    }
                }
            }

            unlink($filePath);

            if (empty($errList)) {
                $result['status_value'] = "Thêm thành công " . $count . " câu hỏi!";
                $result['status'] = 1;
            } else {
                $result['status_value'] = "Lỗi! Không thể thêm câu hỏi có STT: " . implode(', ', $errList) . ', vui lòng xem lại.';
                $result['status'] = 0;
            }
        } else {
            $result['status_value'] = "Không tìm thấy tệp được tải lên!";
            $result['status'] = 0;
        }
        return response()->json($result);
    }
    public function notificationsToStudent(Request $request)
    {
        $teacherId = $request->user('teachers')->teacher_id;
        $name = $request->user('teachers')->name;
        $classId = classes::where('teacher_id', $teacherId)->pluck('class_id');
        $notifications = notifications::join('student_notifications', 'notifications.notification_id', '=', 'student_notifications.notification_id')
            ->whereIn('student_notifications.class_id', $classId)->where('name', $name)
            ->get();

        return response()->json([
            'message' => 'Thông báo được truy xuất thành công!',
            'notifications' => $notifications
        ], 200);
    }
    public function notificationsByAdmin(Request $request)
    {
        $teacherId = $request->user("teachers")->teacher_id;
        $notifications = Notifications::whereIn('notification_id', function ($query) use ($teacherId) {
            $query->select('notification_id')
                ->from('teacher_notifications')
                ->where('teacher_id', $teacherId);
        })->get();

        return response()->json([
            'message' => 'Thông báo được truy xuất thành công!',
            'data' => $notifications,
        ], 200);
    }

    public function sendNotification(Request $request)
    {
        $user = $request->user('teachers');
        $validator = Validator::make($request->all(), [
            'notification_title' => 'required|string|max:255',
            'notification_content' => 'required|string',
            'class_id' => 'required|array',
            'class_id.*' => 'required|integer',
        ], [
            'notification_title.string' => 'Notification_title phải là chuỗi!',
            'notification_content.string' => 'Notification_content phải là chuỗi!',
            'notification_title.max' => 'Notification_title phải là 255 kí tự!',
            'class_id.required' => 'Chưa lớp người nhận!',
            'class_id.array' => 'Class_id phải là mảng!',
            'class_id.*.required' => 'Mỗi class_id trong mảng là bắt buộc!',
            'class_id.*.integer' => 'Mỗi class_id trong mảng phải là số nguyên!',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $notification = Notifications::create([
            'name' => $user->name,
            'username' => $user->username,
            'notification_title' => $request->notification_title,
            'notification_content' => $request->notification_content,
            'time_sent' => Carbon::now('Asia/Ho_Chi_Minh'),
        ]);
        $classNames = [];
        foreach ($request->class_id as $class_id) {
            Student_Notifications::create([
                'notification_id' => $notification->notification_id,
                'class_id' => $class_id,
            ]);
            $class = Classes::find($class_id);
            if ($class) {
                $classNames[] = $class->class_name;
            }
        }

        Log::info('Notification sent', ['notification_id' => $notification->id]);
        $id = $user->teacher_id;
        return response()->json([
            'message' => 'Gửi thông báo thành công cho các lớp: ' . implode(', ', $classNames),
            'data' => $notification
        ], 200);
    }
}
