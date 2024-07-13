<?php

namespace App\Http\Controllers;

use App\Models\admin;
use App\Models\questions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PhpOffice\PhpSpreadsheet\IOFactory;
use App\Http\Controllers\Controller;
use App\Models\grade;
use App\Models\level;
use App\Models\status;
use App\Models\subjects;
use App\Models\tests;
use Carbon\Carbon;
use Carbon\CarbonTimeZone;
use Illuminate\Support\Facades\Validator;

class Admincontroller extends Controller
{
    public function search(Request $request)
    {
    $keySearch = $request->key_search;

    $data = questions::where('question_content', 'like', '%' . $keySearch . '%')
                    ->get();

        return response()->json([
            'data'  => $data
        ]);
    }
    public function getAdmin()
    {
        $data = admin::get();
        if ($data->isEmpty()) {
            return response()->json([
                'status' => false,
                'message' => 'No admin found!',
            ], 400);
        }
        return response()->json([
            'data'    => $data,
        ]);
    }
    public function check_add_admin_via_file(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|file|mimes:xlsx',
        ], [
            'file.required' => 'Vui lòng chọn tệp để tiếp tục.',
            'file.mimes' => 'Chỉ chấp nhận tệp với định dạng xlsx.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()->toArray(),
            ], 422, [], JSON_UNESCAPED_UNICODE);
        }

        if ($request->hasFile('file')) {
            $filePath = $request->file('file')->path();

            $reader = IOFactory::createReader('Xlsx');
            $spreadsheet = $reader->load($filePath);
            $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);

            $count = 0;
            $errDetails = [];

            foreach ($sheetData as $key => $row) {
                if ($key < 4) {
                    continue;
                }

                if (empty($row['A'])) {
                    continue;
                }

                $validationRules = [
                    'name' => 'required|string|min:6|max:50',
                    'username' => 'required|string|min:6|max:50',
                    'email' => 'nullable|email|unique:admins,email',
                    'password' => 'required|string|min:6|max:20',
                    'birthday' => 'nullable|date',
                    'gender' => 'required|string|in:Nam,Nữ,Khác',
                ];

                $validationMessages = [
                    'name.required' => 'Tên không được để trống',
                    'name.string' => 'Tên phải là chuỗi',
                    'name.min' => 'Tên phải chứa ít nhất 6 ký tự',
                    'name.max' => 'Tên chỉ được chứa tối đa 50 ký tự',
                    'username.required' => 'Username không được để trống',
                    'username.string' => 'Username phải là chuỗi',
                    'username.min' => 'Username phải chứa ít nhất 6 ký tự',
                    'username.max' => 'Username chỉ được chứa tối đa 50 ký tự',
                    'email.email' => 'Email không đúng định dạng',
                    'email.unique' => 'Email đã được sử dụng',
                    'password.required' => 'Password không được để trống',
                    'password.string' => 'Password phải là chuỗi',
                    'password.min' => 'Password phải chứa ít nhất 6 ký tự',
                    'password.max' => 'Password chỉ được chứa tối đa 20 ký tự',
                    'birthday.date' => 'Ngày sinh không hợp lệ',
                    'gender.required' => 'Giới tính không được để trống',
                    'gender.string' => 'Giới tính phải là chuỗi',
                    'gender.in' => 'Giới tính không hợp lệ',
                ];

                $dataToValidate = [
                    'name' => $row['B'],
                    'username' => $row['C'],
                    'email' => $row['D'],
                    'password' => $row['E'],
                    'birthday' => $row['F'],
                    'gender' => $row['G'],
                ];

                $customValidator = Validator::make($dataToValidate, $validationRules, $validationMessages);

                if ($customValidator->fails()) {
                    $errDetails[$row['A']] = implode(', ', $customValidator->errors()->all());
                    continue;
                }

                $password = bcrypt($row['E']);
                $gender = ($row['G'] == 'Nam') ? 2 : (($row['G'] == 'Nữ') ? 3 : 1);
                $admin = new Admin([
                    'name' => $row['B'],
                    'username' => $row['C'],
                    'email' => $row['D'],
                    'password' => $password,
                    'birthday' => $row['F'],
                    'gender_id' => $gender,
                    'last_login' => now()->timezone('Asia/Ho_Chi_Minh'),
                ]);

                if ($admin->saveQuietly()) {
                    $count++;
                } else {
                    $errDetails[$row['A']] = "Lỗi khi thêm tài khoản";
                }
            }

            unlink($filePath);

            if (empty($errDetails)) {
                $result['status_value'] = "Thêm thành công " . $count . " tài khoản ADMIN";
                $result['status'] = 200;
            } else {
                $result['status_value'] = "Lỗi! Thông tin lỗi cụ thể cho từng tài khoản: " . json_encode($errDetails, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
                $result['status'] = 442;
            }
        } else {
            $result['status_value'] = "Không tìm thấy tệp được tải lên";
            $result['status'] = 400;
        }

        return response()->json($result,  $result['status'], [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }
    public function indexAdmin()
    {
        return view('admin.CRUD');
    }
    public function createAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'          => 'required|string|min:3|max:50',
            'username'      => 'required|string|min:6|max:50',
            'gender_id'     => 'required|integer',
            'password'      => 'required|string|min:6|max:20',
            'email'         => 'required|email|min:6|max:20|unique:admins,email',
            'permission'    => 'nullable',
            'birthday'      => 'nullable|date',
        ], [
            'name.min'              => 'Tên Admin tối thiểu 3 kí tự!',
            'name.max'              => 'Tên Admin dài nhất 50 ký tự!',
            'name.unique'           => 'Tên Admin đã tồn tại!',
            'name.required'         => 'Tên Admin không được để trống!',
            'username.required'     => 'Username không được để trống!',
            'username.unique'       => 'Username đã tồn tại!',
            'password.required'     => 'Password không được để trống!',
            'password.min'          => 'Password tối thiểu 6 kí tự!',
            'email.email'           => 'Email không đúng định dạng!',
            'email.unique'          => 'Email đã được sử dụng!',
            'birthday.date'         => 'Ngày Sinh phải là một ngày hợp lệ!',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $data = $request->all();
        $data['password'] = bcrypt($data['password']);
        $data['last_login'] = Carbon::now('Asia/Ho_Chi_Minh');
        $admin = admin::create($data);
        return response()->json([
            'message'   => 'Thêm Admin thành công!',
            'admin'   => $admin,
        ]);
    }

   public function deleteAdmin(Request $request)
   {
       $admin_id = $request->admin_id;
       $admin = admin::find($admin_id);
       if ($admin) {
           $admin->delete();
           return response()->json([
               'message' => 'Xóa Admin thành công!',
               'admin' => $admin
           ]);
       } else {
           return response()->json([
               'message' => 'Admin không tồn tại!'
           ], 404);
       }
   }
    public function updateAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'admin_id' => 'required|exists:admins,admin_id',
            'admin_id' => 'required|exists:admins,admin_id',
            'name' => 'sometimes|string|min:6|max:50',
            'gender_id' => 'sometimes|integer',
            'birthday' => 'sometimes|date',
            'password' => 'sometimes|string|min:6|max:20',
        ], [
            'admin_id.required' => 'admin_id không được để trống!',
            'admin_id.exists' => 'Admin không tồn tại!',
            'name.min' => 'Tên Admin tối thiểu 6 kí tự!',
            'name.required' => 'Tên Admin không được để trống!',
            'gender_id.required' => 'Giới tính không được để trống!',
            'birthday.date' => 'Ngày Sinh phải là một ngày hợp lệ!',
            'password.min' => 'Mật khẩu tối thiểu 6 kí tự!',
            'password.max' => 'Mật khẩu không được quá 20 kí tự!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $admin = admin::find($request->admin_id);
        $data = $request->only(['name', 'username', 'gender_id', 'birthday', 'password', 'permission',]);

        $admin = admin::find($request->admin_id);
        $data = $request->only(['name', 'username', 'gender_id', 'birthday', 'password', 'permission',]);


        if (isset($data['password']))

        if (isset($data['password']))
            $data['password'] = bcrypt($data['password']);

        $admin->fill($data)->save();

        return response()->json([
            'message'   => 'Cập nhật thông tin thành công!',
            'admin'   => $admin,
        ]);
    }

    public function getQuestion()
    {
        $data = questions::with('teacher')->orderBy('question_id','desc')->get();
        if (!$data) return response()->json([
            'message' => 'No question found!',
        ], 400);
        return response()->json([
            'data' => $data,
        ]);
    }

    public function getLevels()
    {
        $level = level::get();

        return response()->json([
            'level' => $level,
        ]);
    }

    public function getGrades()
    {
        $grade = grade::get();

        return response()->json([
            'grade' => $grade,
        ]);
    }

    public function getStatus()
    {
        $status = status::get();

        return response()->json([
            'status' => $status,
        ]);
    }

    public function getSubjects()
    {
        $subjects = subjects::get();

        return response()->json([
            'subjects' => $subjects,
        ]);
    }


    public function checkAddQuestionViaFile(Request $request)
    {
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
                        'correct_answer' => strtolower($correctAnswer),
                        'grade_id' => $gradeId,
                        'unit' => $unit,
                        'suggest' => $suggest,
                        'status_id' => 3,
                        'teacher_id' => null,
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

    public function checkAddQuestions(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_id'        => 'required|integer|exists:subjects,subject_id',
            'question_content'  => 'required|string',
            'grade_id'          => 'required|integer|exists:grades,grade_id',
            'level_id'          => 'required|integer|exists:levels,level_id',
            'unit'              => 'required|string',
            'answer_a'          => 'required|string',
            'answer_b'          => 'required|string',
            'answer_c'          => 'required|string',
            'answer_d'          => 'required|string',
            'correct_answer'    => 'required',
            'status_id'         => 'required|integer|in:1,2,3',
            'suggest'           => 'nullable|string',
        ], [
            'subject_id.required'           => 'Mã môn học không được để trống!',
            'subject_id.exists'             => 'Mã môn học không tồn tại!',
            'question_content.required'     => 'Nội dung câu hỏi không được để trống!',
            'grade_id.required'             => 'Mã khối học không được để trống!',
            'grade_id.exists'               => 'Mã khối học không tồn tại!',
            'level_id.required'             => 'Mã cấp độ không được để trống!',
            'level_id.exists'               => 'Mã cấp độ không tồn tại!',
            'unit.required'                 => 'Đơn vị không được để trống!',
            'answer_a.required'             => 'Câu trả lời A không được để trống!',
            'answer_b.required'             => 'Câu trả lời B không được để trống!',
            'answer_c.required'             => 'Câu trả lời C không được để trống!',
            'answer_d.required'             => 'Câu trả lời D không được để trống!',
            'correct_answer.required'       => 'Câu trả lời đúng không được để trống!',
            'correct_answer.in'             => 'Câu trả lời đúng phải là A, B, C hoặc D!',
            'status_id.required'            => 'Trạng thái không được để trống!',
            'status_id.in'                  => 'Trạng thái không hợp lệ!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $data = request()->only(['chapter_id','question_content', 'level_id', 'answer_a', 'answer_b', 'subject_id', 'answer_c', 'answer_d', 'correct_answer', 'grade_id', 'unit', 'suggest', 'status_id', 'teacher_id']);

        $data['correct_answer'] = strtolower($data['correct_answer']);
        $question =  questions::create($data);
        return response()->json(['question' => $question]);
    }


    public function updateQuestions(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question_id'       => 'required|integer|exists:questions,question_id',
            'question_content'  => 'nullable|string',
            'level_id'          => 'nullable|integer|exists:levels,level_id',
            'answer_a'          => 'nullable|string',
            'answer_b'          => 'nullable|string',
            'answer_c'          => 'nullable|string',
            'answer_d'          => 'nullable|string',
            'correct_answer'    => 'nullable',
            'grade_id'          => 'nullable|integer|exists:grades,grade_id',
            'unit'              => 'nullable|string',
            'suggest'           => 'nullable|string',
            'status_id'         => 'nullable|integer',
            'teacher_id'        => 'nullable|integer|exists:teachers,teacher_id',
        ], [
            'question_id.required'      => 'ID câu hỏi là bắt buộc!',
            'question_id.exists'        => 'Không tìm thấy câu hỏi với ID đã chọn!',
            'level_id.exists'           => 'Không tìm thấy level với ID đã chọn!',
            'grade_id.exists'           => 'Không tìm thấy grade với ID đã chọn!',
            'teacher_id.integer'        => 'Teacher ID phải là số nguyên!',
            'teacher_id.exists'         => 'Không tìm thấy giáo viên với ID đã chọn!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $question = questions::find(request()->question_id);
        if (empty($question)) {
            return response()->json(["message" => "Không tìm thấy câu hỏi!"], 400);
        }

        $data = $request->only(['chapter_id','question_content', 'level_id', 'answer_a', 'answer_b', 'subject_id', 'answer_c', 'answer_d', 'correct_answer', 'grade_id', 'unit', 'suggest', 'status_id', 'teacher_id']);
        $question->fill($data);
        $question->fill($data)->save();
        return response()->json(["question" => $question]);
    }

    public function deleteQuestion(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question_id' => 'required|exists:questions,question_id'
        ], [
            'question_id.exists' => 'Câu hỏi có vẻ không tồn tại!',
            'question_id.required' => 'ID câu hỏi là bắt buộc!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $question_id = $request->question_id;
        $question = questions::find($question_id);

        if (!$question) {
            return response()->json([
                'status'    => false,
                'message'   => 'Xoá câu hỏi không thành công!',
            ]);
        }
        $question->delete();
        return response()->json([
            'status'    => true,
            'message'   => 'Xoá câu hỏi thành công!',
        ]);
    }

    public function checkAddTest(Request $request)
    {
        $testName   = $request->test_name;
        $password   = bcrypt($request->password);
        $gradeId    = $request->grade_id;
        $subjectId  = $request->subject_id;
        $levelId    = $request->level_id;
        $totalQuestions = $request->total_questions;
        $questionEasy = $request->question_easy;
        $questionAverage = $request->question_average;
        $questionDifficult = $request->question_difficult;
        $timeToDo   = $request->time_to_do;
        $note       = $request->note;

        $testCode   = rand(100000, 999999);
        $teacher    = new admin();
        $total      = $teacher->getCountQuestions($subjectId, $gradeId);

        if (empty($testName) || empty($timeToDo) || empty($password)) {
            $result['status_value'] = "Không được bỏ trống các trường nhập!";
            $result['status'] = 0;
        } else {
            if ($totalQuestions != null) {
                if ($totalQuestions > $total->question_count) {
                    $result['status_value'] = "Số lượng câu hỏi môn " . $total->subject_detail . " " . $total->grade_detail . " không đủ! Vui lòng nhập số lượng tối đa " . $total->question_count . " câu hỏi!";
                    $result['status'] = 0;
                    if ($total->question_count == 0) {
                        $result['status_value'] = "Không có câu hỏi nào trong ngân hàng câu hỏi cho môn " . $total->subject_detail . " " . $total->grade_detail . "!";
                    }
                } else {
                    $test = new Tests([
                        'test_name' => $testName,
                        'password' => $password,
                        'subject_id' => $subjectId,
                        'grade_id' => $gradeId,
                        'level_id' => $levelId,
                        'total_questions' => $totalQuestions,
                        'time_to_do' => $timeToDo,
                        'note' => $note,
                        'status_id' => 3,
                    ]);
                    $test->saveQuietly();

                    if ($test) {
                        $result['status_value'] = "Thêm thành công!";
                        $result['status'] = 1;

                        $adminModel = new Admin();
                        $limit = $adminModel->calculateQuestionLevel($totalQuestions, $levelId);
                        foreach ($limit as $levelId => $limitQuest) {
                            $listQuest = $adminModel->getListQuestByLevel($gradeId, $subjectId, $levelId, $limitQuest);
                            foreach ($listQuest as $quest) {
                                $adminModel->addQuestToTest($test->test_code, $quest->question_id);
                            }
                        }
                    } else {
                        $result['status_value'] = "Thêm thất bại!";
                        $result['status'] = 0;
                    }
                }
            } else {
                $totalQuestions = $questionEasy + $questionAverage + $questionDifficult;
                if ($totalQuestions > $total->question_count) {
                    $result['status_value'] = "Số lượng câu hỏi môn " . $total->subject_detail . " " . $total->grade_detail . " không đủ! Vui lòng nhập số lượng tối đa " . $total->question_count . " câu hỏi!";
                    $result['status'] = 0;
                    if ($total->question_count == 0) {
                        $result['status_value'] = "Không có câu hỏi nào trong ngân hàng câu hỏi cho môn " . $total->subject_detail . " " . $total->grade_detail . "!";
                    }
                } else {
                    $test = new Tests([
                        'test_name' => $testName,
                        'password' => $password,
                        'subject_id' => $subjectId,
                        'grade_id' => $gradeId,
                        'level_id' => $levelId,
                        'total_questions' => $totalQuestions,
                        'time_to_do' => $timeToDo,
                        'note' => $note,
                        'status_id' => 3,
                    ]);
                    $test->saveQuietly();
                    if ($test) {
                        $result['status_value'] = "Thêm thành công!";
                        $result['status'] = 1;
                        //Tạo bộ câu hỏi cho đề thi
                        $adminModel = new admin();
                        $limit = $adminModel->caculatorQuestionNormal($questionEasy, $questionAverage, $questionDifficult);
                        foreach ($limit as $levelId => $limitQuest) {
                            $listQuest = $adminModel->getListQuestByLevel($gradeId, $subjectId, $levelId, $limitQuest);
                            foreach ($listQuest as $quest) {
                                $adminModel->addQuestToTest($test->test_code, $quest->question_id);
                            }
                        }
                    } else {
                        $result['status_value'] = "Thêm thất bại!";
                        $result['status'] = 0;
                    }
                }
            }
        }
        return response()->json([
            'result' => $result,

        ]);
    }

    public function getTest()
    {
        $data = tests::orderBy('timest', 'desc')->get();
        if ($data->isEmpty()) {
            return response()->json([
                'status' => false,
                'message' => 'No test found!',
            ], 400);
        }
        return response()->json([
            'data'    => $data,
        ]);
    }
    public function getTestDetail(Request $request, $test_code)
    {
        $questions = [];
        $data  = tests::find($test_code);
        foreach ($data->questions as $question) {
            $questions[] = $question;
        }
        $data['questions'] = $questions;

        return response()->json(["data" => $data]);
    }
    public function changeStatus(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'status_id' => 'required|integer|in:1,2,3,4,5',
            'test_code' => 'required|string|exists:tests,test_code',
        ], [
            'status_id.required' => 'Trường trạng thái là bắt buộc.',
            'status_id.integer' => 'Trường trạng thái phải là một số nguyên.',
            "status_id.in" => "Trạng thái phải thuộc các giá trị: 1, 2, 3, 4, 5.",
            'test_code.required' => 'Test_code là bắt buộc.',
            'test_code.exists' => 'Test_code không tìm thấy!',
            'test_code.string' => 'Test_code phải là một chuỗi.',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 422);
        }
        $status_id = $request->status_id;
        $test = tests::where('test_code', $request->test_code)->first();
        if ($test->status_id == $status_id) {
            return response()->json([
                'status_value' => "Đề thi đang trong trạng thái này!",
                'status_id' => $status_id
            ]);
        }

        $test->status_id = $status_id;
        $test->save();
            return response()->json([
                'status_value' => "Trạng thái đề thi đã được thay đổi!",
                'status_id' => $status_id
            ], 200);
    }
    public function updateTest(Request $request, $test_code)
    {
        $validator = Validator::make($request->all(), [
            'status_id' => 'required|integer|in:1,2,3,4,5',
        ], [
            'status_id.required' => 'Trường trạng thái là bắt buộc.',
            'status_id.integer' => 'Trường trạng thái phải là một số nguyên.',
            "status_id.in" => "Trạng thái phải thuộc các giá trị: 1, 2, 3, 4, 5.",
        ]);
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 422);
        }
        $test = tests::find($test_code);
        $test->status_id = $request->status_id;
        $test->save();
        return response()->json($test);
    }
}
