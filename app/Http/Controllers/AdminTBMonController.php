<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\IOFactory;
use App\Models\subject_head;
use App\Models\subjects;
use Carbon\Carbon;
use Carbon\CarbonTimeZone;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Validator;

class AdminTBMonController extends Controller
{
    // quản lý trưởng bộ môn
    public $successStatus = 200;
    public function index()
    {
        $getAllTBM = subject_head::all();
        if ($getAllTBM->isEmpty()) {
            return response()->json([
                'message' => 'No data found',
            ], 400);
        }
        return response()->json([
            'message' => 'success',
            'data' => $getAllTBM
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


            $teacher = DB::table('subject_head')
                ->select('permission')
                ->where('email', $email)
                ->orWhere('email', $password)
                ->first();

            if ($teacher) {
                $permission = $teacher->permission;
            }

            $token  = Auth::guard('apiTBM')->attempt([
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

    public function check_add_tbm_via_file(Request $request)
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
                'status_value' => $validator->errors()->toArray(),
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
                    'username' => 'required|string|min:6|max:50|unique:subject_head,username',
                    'email' => 'nullable|email|unique:subject_head,email',
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
                    'subject_id.required' => 'Cần chọn bộ Môn',
                    'subject_id.exists' => 'Không tìm thấy Môn',
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

                if ($customValidator->fails()) {
                     $errDetails[$row['A']] = implode(', ', $customValidator->errors()->all());
                     return response()->json(["status_value" => 'Lỗi ở dòng các dòng ' .$row['A'].' '. implode(', ', $errDetails)], 400, [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
                }

                $password = bcrypt($row['E']);
                $gender = ($row['G'] == 'Nam') ? 2 : (($row['G'] == 'Nữ') ? 3 : 1);
                $subject_head = new subject_head([
                    'name' => $row['B'],
                    'username' => $row['C'],
                    'email' => $row['D'],
                    'password' => $password,
                    'birthday' => $row['F'],
                    'gender_id' => $gender,
                    'subject_id' => $row['H'],
                    'last_login' => now()->timezone('Asia/Ho_Chi_Minh'),
                ]);

                if ($subject_head->saveQuietly()) {
                    $count++;
                } else {
                    $errDetails[$row['A']] = "Lỗi khi thêm tài khoản";
                }
            }

            unlink($filePath);

            if (empty($errDetails)) {
                $result['status_value'] = "Thêm thành công " . $count . " tài khoản Trưởng Bộ Môn";
                $result['status'] = true;
            } else {
                $result['status_value'] = "Lỗi! Thông tin lỗi cụ thể cho từng tài khoản: " . json_encode($errDetails, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
                $result['status'] = 442;
            }
        }

        return response()->json($result, 200, [], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }
    public function createTBM(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'          => 'required|string|min:6|max:50|unique:subject_head,name',
            'username'      => 'required|string|min:6|max:50',
            'gender_id'     => 'required|integer',
            'password'      => 'required|string|min:6|max:20',
            'email'         => 'nullable|email|unique:subject_head,email',
            'permission'    => 'nullable',
            'birthday'      => 'nullable|date',
            'subject_id'      => 'nullable|integer',
        ], [
            'name.min'              => 'Tên Trưởng bộ môn tối thiểu 6 kí tự!',
            'name.max'              => 'Tên Trưởng bộ môn phải là 50 kí tự!',
            'name.unique'           => 'Tên Trưởng bộ môn đã tồn tại!',
            'username.min'          => 'Username tối thiểu 6 kí tự!',
            'name.required'         => 'Tên Trưởng bộ môn không được để trống!',
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
        $subject_head = subject_head::create($data);
        return response()->json([
            'message'   => 'Thêm Trưởng Bộ Môn thành công!',
            'subject_head'   => $subject_head,
        ]);
    }

    public function deleteTBM(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_head_id' => 'required|exists:subject_head,subject_head_id'
        ], [
            'subject_head_id.*' => 'Trưởng bộ môn không tồn tại!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $tbm = subject_head::find($request->subject_head_id)->delete();
            return response()->json([
                'message'   => 'Xoá trưởng bộ môn thành công!',
                'tbm'    => $tbm,
            ]);
        }

    // public function updateTBM(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'subject_head_id' => 'sometimes|exists:subject_head,subject_head_id',
    //         'name' => 'sometimes|string|min:6|max:50',
    //         'gender_id' => 'sometimes|integer',
    //         'birthday' => 'nullable|date',
    //         'password' => 'nullable|string|min:6|max:20',
    //     ], [
    //         'subject_head_id.required' => 'Trưởng bộ môn không được để trống!',
    //         'student_id.exists' => 'Trưởng bộ môn không tồn tại!',
    //         'name.min' => 'Tên Trưởng bộ môn tối thiểu 6 kí tự!',
    //         'name.required' => 'Tên Trưởng bộ môn không được để trống!',
    //         'gender_id.required' => 'Giới tính không được để trống!',
    //         'birthday.date' => 'Ngày Sinh phải là một ngày hợp lệ!',
    //         'password.min' => 'Mật khẩu tối thiểu 6 kí tự!',
    //         'password.max' => 'Mật khẩu không được quá 20 kí tự!',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json([
    //             'status' => false,
    //             'errors' => $validator->errors(),
    //         ], 422);
    //     }
    //     $tbm = subject_head::find($request->subject_head_id);
    //     if ($tbm) {
    //         $data = $request->all();
    //         $data['password'] = bcrypt($data['password']);
    //         $tbm->update($data);

    //         return response()->json([
    //             'status'    => true,
    //             'message'   => 'Cập nhật trưởng bộ môn thành công!',
    //         ]);
    //     } else {
    //         return response()->json([
    //             'status'    => false,
    //             'message'   => 'Không tìm thấy trưởng bộ môn!',
    //         ]);
    //     }
    // }
    public function updateTBM(Request $request)
{
    $validator = Validator::make($request->all(), [
        'subject_head_id' => 'sometimes|exists:subject_head,subject_head_id',
        'name' => 'sometimes|string|min:6|max:50',
        'gender_id' => 'sometimes|integer',
        'birthday' => 'nullable|date',
        'password' => 'nullable|string|min:6|max:20',
    ], [
        'subject_head_id.required' => 'Trưởng bộ môn không được để trống!',
        'subject_head_id.exists' => 'Trưởng bộ môn không tồn tại!',
        'name.min' => 'Tên Trưởng bộ môn tối thiểu 6 kí tự!',
        'name.required' => 'Tên Trưởng bộ môn không được để trống!',
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

    $tbm = subject_head::find($request->subject_head_id);
    if (!$tbm) {
        return response()->json([
            'status'    => false,
            'message'   => 'Không tìm thấy trưởng bộ môn!',
        ]);
    }

    // Kiểm tra nếu trường password tồn tại trong dữ liệu gửi đi
    if ($request->has('password')) {
        $data = $request->all();
        $data['password'] = bcrypt($data['password']);
        $tbm->update($data);
    } else {
        // Nếu không có trường password, bỏ qua việc cập nhật trường này
        $tbm->update($request->except('password'));
    }

    return response()->json([
        'status'    => true,
        'message'   => 'Cập nhật trưởng bộ môn thành công!',
    ]);
}

}
