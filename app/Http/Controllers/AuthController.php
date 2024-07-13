<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use App\Mail\ForgetPass;
use App\Models\admin;
use App\Models\student;
use App\Models\subject_head;
use App\Models\teacher;
use App\Rules\EmailExistsInMultipleTables;
use App\Services\OtpService;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */


    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            //'username' => 'required|string|exists:admins,username',
            'email'    => 'required|email',
            'password' => 'required|max:20',
        ], [
            // 'username.required' => 'Tên đăng nhập là bắt buộc!',
            // 'username.exists'   => 'Tên đăng nhập không tồn tại!',
            'email.required'    => 'Email là bắt buộc!',
            'email.email'       => 'Email phải là định dạng hợp lệ!',
            'password.required' => 'Mật khẩu là bắt buộc!',
            'password.max'      => 'Mật khẩu tối đa 20 kí tự!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $credentials = request(['email', 'password']);
        // admin
        $token = auth('admins')->attempt($credentials);
        if($token){
            return response()->json(["access_token"=>$token]);
        }
        // subject_head
        $token = auth('subject_heads')->attempt($credentials);
        if($token){
            return response()->json(["access_token"=>$token]);
        }
        // teachers
        $token = auth('teachers')->attempt($credentials);
        if($token){
            return response()->json(["access_token"=>$token]);
        }
        // students
        $token = auth('students')->attempt($credentials);
        if($token){
            return response()->json(["access_token"=>$token]);
        }
        //tim cac model va khong co ket qua thi se tra ve la khong tim
            return response()->json(['error' => 'Wrong email or password'], 400);
    }

    public function forgetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'email', new EmailExistsInMultipleTables],
        ], [
            'email.required' => 'Email là bắt buộc!',
            'email.email' => 'Email phải là định dạng hợp lệ!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        // Gửi OTP cho người dùng
        $email = $request->email;
        $otp = OtpService::sendOtp($email);

        return response()->json([
            'message' => 'Gửi OTP thành công!',

        ], 200);
    }

    public function verifyOtpAndResetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'email', new EmailExistsInMultipleTables],
            'otp' => 'required|string',
        ],[
            'email.required' => 'Email là bắt buộc!',
            'email.email' => 'Email phải là định dạng hợp lệ!',
            'otp.required' => 'OTP là bắt buộc!',
            'otp.string' => 'OTP phải là định dạng hợp lệ!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        // Kiểm tra OTP và xác nhận mật khẩu mới
        $email = $request->email;
        $otp = $request->otp;

        if (OtpService::verifyOtp($email, $otp)) {
            // Xác nhận OTP thành công, reset mật khẩu
            $userTypes = [Admin::class, Subject_Head::class, Teacher::class, Student::class];
            foreach ($userTypes as $userType) {
                $user = $userType::where('email', $email)->first();
                if ($user) {
                    $newPass = Str::random(8);
                    $user->password = bcrypt($newPass);
                    $user->password_change_time = Carbon::now()->addMinutes(15); //set mật khẩu mới có hạn 15 phút
                    $user->save();
                    Mail::send('email.check_email_forget', ['user' => $user, 'newPass' => $newPass], function ($message) use ($user) {
                        $message->to($user->email, $user->name)->subject('Khôi phục mật khẩu của bạn!');
                    });
                }
            }

            return response()->json([
                'message' => 'Xác nhận OTP và đặt lại mật khẩu thành công!',
            ], 200);
        } else {
            return response()->json([
                'message' => 'Xác nhận OTP không thành công!',
            ], 400);
        }
    }
    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me(Request $request)
    {
        $user = auth('admins')->user();
        if($user){
            return response()->json($user);
        }
        $user = auth('subject_heads')->user();
        if($user){
            return response()->json($user);
        }
        $user = auth('teachers')->user();
        if($user){
            return response()->json($user);
        }
        $user = auth('students')->user();
        if($user){
            return response()->json($user);
        }
        return response()->json(['error' => 'User not found'], 401);
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}
