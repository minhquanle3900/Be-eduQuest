<?php

namespace App\Http\Controllers;

use App\Rules\EmailExistsInMultipleTables;
use App\Rules\UniqueNameAcrossModels;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;


class ProfileController extends Controller
{
    public function updateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'nullable|min:3|max:255',
            'username' => 'nullable|min:3|max:255',
            'gender_id' => 'nullable|integer',
            'birthday' => 'nullable|date',
            'password' => 'nullable|min:6|max:20',
            'email' => ['nullable', 'email', new EmailExistsInMultipleTables],
            'avatar' => 'nullable|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ], [
            'name.min' => 'Tên phải có ít nhất 3 ký tự.',
            'name.max' => 'Tên không được vượt quá 255 ký tự.',
            'username.min' => 'Tên phải có ít nhất 3 ký tự.',
            'username.max' => 'Tên không được vượt quá 255 ký tự.',
            'gender_id.integer' => 'Giới tính phải là số nguyên.',
            'birthday.date' => 'Ngày sinh phải là ngày hợp lệ.',
            'password.min' => 'Mật khẩu phải có ít nhất 6 ký tự.',
            'password.max' => 'Mật khẩu không được vượt quá 20 ký tự.',
            'email.email' => 'Email phải có định dạng hợp lệ.',
            'avatar.mimes' => 'Ảnh đại diện phải là các định dạng: jpeg, png, jpg, gif, svg.',
            'avatar.max' => 'Kích thước ảnh đại diện không được vượt quá 2048 KB.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        //kiểm tra người dùng
        $userType = ['admins', 'subject_heads', 'teachers', 'students'];
        foreach ($userType as $type) {
            $user = $request->user($type);
            if ($user) {
                break;
            }
        }
        //nếu không thì ré
        if (!$user) {
            return response()->json([
                'message' => 'Người dùng không tồn tại!',
            ], 403);
        }
        //check ra người dùng thì cho phép đổi thông tin
        $data = $request->only(['name','username', 'gender_id', 'birthday', 'email']);
        //password
        if ($request->filled('password')) {
            $data['password'] = bcrypt($request->password);
        }
        //đổi avatar
        if ($request->hasFile('avatar')) {
            if ($user->avatar != "avatar-default.jpg") {
                Storage::delete('public/' . str_replace('/storage/', '', $user->avatar));
            }
            $image = $request->file('avatar');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = $image->storeAs('images',  $imageName, 'public');
            $data['avatar'] = '/storage/' . $imagePath;
        }

        $user->update($data);

        if ($request->hasFile('avatar') && $request->filled('password')) {
            return response()->json([
                'message' => "Thay đổi mật khẩu và avatar thành công!",
                'data' => [
                    'avatar' => $user->avatar,
                    'password' => "Thay đổi mật khẩu thành công!"
                ]
            ], 200);
        } elseif ($request->hasFile('avatar')) {
            return response()->json([
                'message' => "Thay đổi avatar thành công!",
                'data' => $user->avatar
            ], 200);
        } elseif ($request->filled('password')) {
            return response()->json([
                'message' => "Thay đổi mật khẩu thành công!",
            ], 200);
        } else {
            return response()->json([
                'message' => "Cập nhật tài khoản cá nhân thành công!",
                'data' => $user
            ], 200);
        }
    }
}
