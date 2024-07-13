<?php
namespace App\Services;

use App\Models\admin;
use App\Models\student;
use App\Models\subject_head;
use App\Models\teacher;
use Illuminate\Support\Facades\Mail;

class OtpService
{
    public static function sendOtp($email)
    {
        $otp = mt_rand(100000, 999999);
        $userTypes = [Admin::class, Subject_Head::class, Teacher::class, Student::class];
        foreach ($userTypes as $userType) {
            $userType::where('email', $email)->update([
                'otp' => $otp,
                'otp_expiry' => now()->addMinutes(5), //set mã otp có hạn 5 phút
            ]);
        }
        Mail::raw("Mã OTP của bạn là: $otp", function ($message) use ($email) {
            $message->to($email)->subject('Xác Nhận Mã OTP');
        });

        return $otp;
    }

    public static function verifyOtp($email, $otp)
    {
        $userTypes = [Admin::class, Subject_Head::class, Teacher::class, Student::class];
        foreach ($userTypes as $userType) {
            $user = $userType::where('email', $email)
                ->where('otp', $otp)
                ->where('otp_expiry', '>=', now()) // Chỉ lấy các mã OTP còn hợp lệ (chưa hết hạn)
                ->first();

            if ($user) {
                // Xác nhận thành công, đặt lại cột 'otp' và 'otp_expiry' thành null
                $user->update(['otp' => null, 'otp_expiry' => null]);
                return true;
            }
        }
    }
}
