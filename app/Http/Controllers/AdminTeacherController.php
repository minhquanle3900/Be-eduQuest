<?php

namespace App\Http\Controllers;

use App\Models\classes;
use App\Models\questions;
use App\Models\teacher;
use Carbon\Carbon;
use Carbon\CarbonTimeZone;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Validator;

class AdminTeacherController extends Controller
{
    public function getTeacher()
    {
        $data = teacher::orderBy('teacher_id', 'desc')->get();
        if ($data->isEmpty()) {
            return response()->json([
                'status' => false,
                'message' => 'No teacher found!',
            ], 400);
        }
        return response()->json([
            'data'    => $data,
        ]);
    }
    public function submitLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            //'username' => 'required|string|exists:admins,username',
            'email'    => 'required|email',
            'password' => 'required|string|max:20|min:6',
        ], [
            // 'username.required' => 'Tên đăng nhập là bắt buộc!',
            // 'username.exists'   => 'Tên đăng nhập không tồn tại!',
            'email.required'    => 'Email là bắt buộc!',
            'email.email'       => 'Email phải là định dạng hợp lệ!',
            'password.required' => 'Mật khẩu là bắt buộc!',
            'password.min'      => 'Mật khẩu tối thiểu 6 kí tự!',
            'password.max'      => 'Mật khẩu tối đa 20 kí tự!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        if ($request->has('email') && $request->has('password')) {
            $email = $request->input('email');
            $password = $request->input('password');


            $teacher = DB::table('teachers')
                ->select('permission')
                ->where('email', $email)
                ->orWhere('email', $password)
                ->first();

            if ($teacher) {
                $permission = $teacher->permission;
            }

            $token  = Auth::guard('apiTeacher')->attempt([
                'email'    => $email,
                'password'    => $password,
            ]);
            // dd($token);
            if ($token) {
                return response()->json([
                    'result' =>  "Đăng nhập thành công",
                    'access_token' => $token,
                    'permission' => $permission,
                    'expires_in' => JWTAuth::factory()->getTTL() * 6000
                ]);
            } else {
                return response()->json([
                    'mesage' =>  "Tài khoản hoặc mật khẩu không đúng!",
                ], 403);
            }
        }
    }

    public function destroy(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'teacher_id' => 'required|exists:teachers,teacher_id'
        ], [
            'teacher_id.*' => 'Giáo Viên không tồn tại!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $teacher = teacher::find($request->teacher_id);

        if ($teacher) {
            $class = classes::where('class_id', $request->teacher_id)->first();

            if ($class) {
                return response()->json([
                    'status'    => 2,
                    'message'   => 'Giáo Viên đang đứng Lớp, bạn không thể xóa!'
                ]);
            } else
                $teacher->delete();

            return response()->json([
                'status'    => true,
                'message'   => 'Đã xóa Giáo Viên thành công!'
            ]);
        }
    }
    public function edit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'teacher_id' => 'sometimes|required|exists:teachers,teacher_id',
            'name' => 'sometimes|string|min:6|max:50',
            'gender_id' => 'sometimes|integer',
            'birthday' => 'sometimes|date',
            'password' => 'sometimes|string|min:6|max:20',
        ], [
            'teacher_id.exists' => 'Giáo Viên không tồn tại!',
            'name.min' => 'Tên Giáo Viên tối thiểu 6 kí tự!',
            'name.required' => 'Tên Giáo Viên không được để trống!',
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

        $teacher = teacher::find($request->teacher_id);
        $data = $request->only(['name', 'username', 'gender_id', 'birthday', 'password', 'permission']);


         if (isset($data['password']))
            $data['password'] = bcrypt($data['password']);

        $teacher->fill($data)->save();

        return response()->json([
            'status'    => true,
            'message'   => 'Cập Nhập thành công thông tin Giáo Viên!',
            'teacher'   => $teacher,
        ]);
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'          => 'required|string|min:6|max:50',
            'username'      => 'string|string|min:6|max:50',
            'gender_id'     => 'required|integer',
            'password'      => 'required|string|min:6|max:20',
            'email'         => 'required|email|unique:teachers,email',
            'birthday'      => 'nullable|date',
        ], [
            'name.min'           => 'Tên Giáo Viên tối thiểu 6 kí tự!',
            'name.max'             => 'Ten Giờ Viên phải là 50 kí tự!',
            'name.unique'          => 'Ten Giáo Viên đã tồn tại!',
            'name.required'         => 'Tên Giáo Viên không được để trống!',
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
        $teacher = Teacher::create($data);

        return response()->json([
            'message' => 'Đã tạo mới giáo viên thành công!',
            "teacher" => $teacher,
        ]);
    }

    public function createFileTeacher(Request $request)
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


            DB::beginTransaction();
            foreach ($sheetData as $key => $row) {
                if ($key < 4) {
                    continue;
                }

                if (empty($row['A'])) {
                    continue;
                }
                $validationRules = [
                    'name' => 'required|string|min:6|max:50',
                    'username' => 'required|string|min:6|max:50|unique:admins,username',
                    'email' => 'nullable|email|unique:teachers,email',
                    'password' => 'required|string|min:6|max:20',
                    'birthday' => 'nullable|date',
                    'gender' => 'required|string|in:Nam,Nữ,Khác',
                    'subject_id' => 'required|exists:subjects,subject_id',
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
                    'username.unique' => 'Username đã tồn tại',
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
                    'subject_id.exists' => 'Môn không tồn tại',
                ];

                $dataToValidate = [
                    'name' => $row['B'],
                    'username' => $row['C'],
                    'email' => $row['D'],
                    'password' => $row['E'],
                    'birthday' => $row['F'],
                    'gender' => $row['G'],
                    'subject_id' => $row['H'],
                ];

                $customValidator = Validator::make($dataToValidate, $validationRules, $validationMessages);
                $errDetails = [];
                if ($customValidator->fails()) {
                    $errDetails[$row['A']] = implode(', ', $customValidator->errors()->all());
                     return response()->json(["status_value" => 'Lỗi ở dòng các dòng ' .$row['A'].' '. implode(', ', $errDetails)], 400, [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
                }

                $password = bcrypt($row['E']);
                $gender = ($row['G'] == 'Nam') ? 2 : (($row['G'] == 'Nữ') ? 3 : 1);
                $teacher = new teacher([
                    'name' => $row['B'],
                    'username' => $row['C'],
                    'email' => $row['D'],
                    'password' => $password,
                    'birthday' => $row['F'],
                    'gender_id' => $gender,
                    'subject_id' => $row['H'],
                    'last_login' => Carbon::now(CarbonTimeZone::createFromHourOffset(7 * 60))->timezone('Asia/Ho_Chi_Minh'),
                ]);

                if ($teacher->saveQuietly()) {
                    $count++;
                } else {
                    $errDetails[$row['A']] =$row['A'] ;
                }
            }

            unlink($filePath);

            if (empty($errDetails)) {
                DB::commit();
                return response()->json(["status_value"=>'Thêm thành công'.$count.'giá tri'], 200, [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
            } else {
                DB::rollBack();
                return response()->json(["status_value" => 'Lỗi ở dòng các dòng ' .$row['A']. implode(', ', $errDetails)], 400, [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
            }
        }
        return response()->json(['status_value'=>"Không tìm thầy file"], 400, [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

    public function search(Request $request)
    {
        $list = teacher::select('teachers.*')
            ->where('name', 'like', '%' . $request->key_search . '%')
            ->orWhere('username', 'like', '%' . $request->key_search . '%')
            ->get();

        return response()->json([
            'list'  => $list
        ]);
    }
    public function deleteCheckbox(Request $request)
    {
        $data = $request->all();
        $deletedTeachers = [];

        foreach ($data as $key => $value) {
            if (isset($value['check'])) {
                $teacherId = $value['teacher_id'];
                $teacher = teacher::find($teacherId);

                if ($teacher) {
                    $class = classes::where('teacher_id', $teacherId)->first();

                    if ($class) {
                        return response()->json([
                            'status' => false,
                            'message' => 'Không thể xóa giáo viên vì giáo viên đang đứng lớp!',
                        ]);
                    }

                    //Không đứng thì xóa thôi
                    $teacher->delete();
                    $deletedTeachers[] = $teacherId;
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => 'Giáo viên có teacher_id ' . $teacherId . ' không tồn tại!',
                    ]);
                }
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Xóa các giáo viên thành công!',
            'deleted_teachers' => $deletedTeachers,
        ]);
    }

    public function checkAddQuestionViaFile(Request $request)
    {
        $result = [];

        $subjectId = $request->subject_id;
        // $subjectId = 10;
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

                $answers = [];
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
                $teacherId = null;
                switch ($correctAnswer) {
                    case "A":
                        $answer = $answerA;
                        break;
                    case "B":
                        $answer = $answerB;
                        break;
                    case "C":
                        $answer = $answerC;
                        break;
                    default:
                        $answer = $answerD;
                }

                if (!empty($questionContent) && $teacherId == null) {
                    $question = new questions([
                        'subject_id' => $subjectId,
                        'question_content' => $questionContent,
                        'level_id' => $levelId,
                        'answer_a' => $answerA,
                        'answer_b' => $answerB,
                        'answer_c' => $answerC,
                        'answer_d' => $answerD,
                        'correct_answer' => $answer,
                        'grade_id' => $gradeId,
                        'unit' => $unit,
                        'suggest' => $suggest,
                        'status_id' => 3,
                        'teacher_id' => $teacherId,
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
}
