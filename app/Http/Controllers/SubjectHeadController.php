<?php

namespace App\Http\Controllers;

use App\Models\subject_head;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;


class SubjectHeadController extends Controller
{
    public function getInfo(Request $request)
    {
        $username = $request->user('subject_head')->username;
        $me = subject_head::select('subject_heads.subject_head_id', 'subject_heads.username', 'subject_heads.avatar', 'subject_heads.email', 'subject_heads.name', 'subject_heads.last_login', 'subject_heads.birthday', 'permissions.permission_detail', 'genders.gender_detail', 'genders.gender_id')
            ->join('permissions', 'subject_heads.permission', '=', 'permissions.permission')
            ->join('genders', 'subject_heads.gender_id', '=', 'genders.gender_id')
            ->where('subject_heads.username', '=', $username)
            ->first();

        return response()->json([
            'message' => 'Lấy thông tin cá nhân thành công!',
            'data' => $me
        ], 200);
    }
    public function updateProfile(Request $request)
    {
        $me = $request->user('subject_head');
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
}
