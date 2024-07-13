<?php

namespace App\Http\Controllers;

use App\Models\student;
use App\Models\student_test_detail;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\IOFactory;
use App\Models\students;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Validator;


class AdminHSController extends Controller
{
    public $successStatus = 200;
    public function index()
    {
        $data = student::orderBy("student_id","desc")->get();
        if (empty($data)) {
            return response()->json([
                'data' => $data
            ]);
        }
        return response()->json([
            'data' => $data,
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
        $result = [];

        if ($request->has('email') && $request->has('password')) {
            $email = $request->input('email');
            $password = $request->input('password');


            $student = DB::table('students')
                ->select('permission')
                ->where('email', $email)
                ->orWhere('email', $password)
                ->first();

            if ($student) {
                $permission = $student->permission;
            }

            $token  = Auth::guard('apiStudents')->attempt([
                'email'    => $email,
                'password'    => $password,
            ]);
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

    public function check_add_hs_via_file(Request $request)
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
                    'email' => 'nullable|email|unique:students,email',
                    'password' => 'required|string|min:6|max:20',
                    'birthday' => 'nullable|date',
                    'gender' => 'required|string|in:Nam,Nữ,Khác',
                    'class_id" => "required|integer|exists:classes,class_id'
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
                    'class_id.required' => 'Lớp không được để trống',
                    'class_id.exists' => 'Lớp không tồn tại',
                ];

                $dataToValidate = [
                    'name' => $row['B'],
                    'username' => $row['C'],
                    'email' => $row['D'],
                    'password' => $row['E'],
                    'birthday' => $row['F'],
                    'gender' => $row['G'],
                    'class_id' => $row['H'],
                    'class_id' => $row['H'],
                ];

                $customValidator = Validator::make($dataToValidate, $validationRules, $validationMessages);

                if ($customValidator->fails()) {
                    $errDetails[$row['A']] = implode(', ', $customValidator->errors()->all());
                    continue;
                }

                $password = bcrypt($row['E']);
                $gender = ($row['G'] == 'Nam') ? 2 : (($row['G'] == 'Nữ') ? 3 : 1);
                $student = new student([
                    'name' => $row['B'],
                    'username' => $row['C'],
                    'email' => $row['D'],
                    'password' => $password,
                    'birthday' => $row['F'],
                    'gender_id' => $gender,
                    'class_id' => $row['H'],
                    'last_login' => now()->timezone('Asia/Ho_Chi_Minh'),
                ]);

                if ($student->saveQuietly()) {
                    $count++;
                } else {
                    $errDetails[$row['A']] = "Lỗi khi thêm tài khoản";
                }
            }

            unlink($filePath);

            if (empty($errDetails)) {
                $result['status_value'] = "Thêm thành công " . $count . " tài khoản Học Sinh!";
                $result['status'] = 200;
            } else {
                $result['status_value'] = "Lỗi! Thông tin lỗi cụ thể cho từng tài khoản: " . json_encode($errDetails, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
                $result['status'] = 422;
            }
        } else {
            $result['status_value'] = "Không tìm thấy tệp được tải lên";
            $result['status'] = 400;
        }

        return response()->json($result,$result['status'], [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }
    public function createHS(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'          => 'required|string|min:6|max:50|unique:students,name',
            'username'      => 'required|string|min:6',
            'gender_id'     => 'required|integer',
            'password'      => 'required|string|min:6|max:20',
            'email'         => 'nullable|email|unique:students,email',
            'permission'    => 'nullable',
            'birthday'      => 'nullable|date',
        ], [
            'name.min'              => 'Tên Học Sinh tối thiểu 6 kí tự!',
            'name.max'              => 'Tên Học Sinh tối thieu 50 ký tự!',
            'name.unique'           => 'Tên Học Sinh da ton tai!',
            'name.required'         => 'Tên Học Sinh không được để trống!',
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
        $student = students::create($data);
        return response()->json([
            'message'   => 'Thêm Học Sinh thành công!',
            'student' => $student,
        ]);
    }

    public function deleteHS(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,student_id'
        ], [
            'student_id.*' => 'Học Sinh không tồn tại!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $hs = students::find($request->student_id);
        if ($hs) {
            $test = student_test_detail::where('student_id', $request->student_id)->first();

            if ($test) {
                return response()->json([
                    'message'   => 'Học sinh đang có bài thi, cần xóa dữ liệu thi trước!',
                    'student' => $test,
                ]);
            }
            $hs->delete();

            return response()->json([
                'message'   => 'Xoá học sinh thành công!',
                'student' => $hs,
            ]);
        }
    }

    public function updateHS(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'student_id' => 'required|exists:students,student_id',
            'name' => 'required|string|min:6|max:50',
            'gender_id' => 'required|integer',
            'birthday' => 'nullable|date',
            'password' => 'nullable|string|min:6|max:20',
        ], [
            'student_id.required' => 'Học Sinh không được để trống!',
            'student_id.exists' => 'Học Sinh không tồn tại!',
            'name.min' => 'Tên Học Sinh tối thiểu 6 kí tự!',
            'name.required' => 'Tên Học Sinh không được để trống!',
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
        $hs = students::find($request->student_id);
        if ($hs) {
            $data = $request->only(['name', 'gender_id','class_id', 'birthday', 'password']);
            if (isset($data['password'])) {
                $data['password'] = bcrypt($data['password']);
            }
            $hs->fill($data)->save();
            return response()->json([
                'status'    => true,
                'message'   => 'Cập nhật học sinh thành công!',
                'student'   => $hs,
            ]);
        } else {
            return response()->json([
                'status'    => false,
                'message'   => 'Không tìm thấy học sinh!',
            ]);
        }
    }
}
