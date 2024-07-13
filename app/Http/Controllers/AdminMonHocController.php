<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\subjects;
use Illuminate\Support\Facades\Validator;


class AdminMonHocController extends Controller
{
    public $successStatus = 200;
    public function index()
    {
        $getAllMon = subjects::all();
        return response()->json([
            'response' => 'success',
            'data' => $getAllMon
        ], $this->successStatus);
    }

    public function updateMon(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_detail'      => 'required|string|max:20',
        ], [
            'subject_detail.required'     => 'Môn học không được để trống!',
            'subject_detail.max'       => 'Tên Môn học tối đa 20 kí tự!',
            'subject_detail.string'       => 'Tên Môn học phải là dạng chuỗi!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $mon = subjects::find($request->subject_id);
        if ($mon) {
            $data = $request->all();
            $mon->update($data);

            return response()->json([
                'status'    => true,
                'message'   => 'Cập nhật môn thành công!',
            ]);
        } else {
            return response()->json([
                'status'    => false,
                'message'   => 'Không tìm thấy môn!',
            ]);
        }
    }

    public function deleteMon(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_id' => 'required|exists:subjects,subject_id'
        ], [
            'subject_id.*' => 'Môn học không tồn tại!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $mon = subjects::find($request->subject_id);
        if ($mon) {
            $mon->delete();
            return response()->json([
                'status'    => true,
                'message'   => 'Xoá môn thành công!',
            ]);
        } else {
            return response()->json([
                'status'    => false,
                'message'   => 'Không tìm môn!',
            ], 404);
        }
    }

    public function createMon(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_detail'      => 'required|string|max:20|unique:subjects,subject_detail',
        ], [
            'subject_detail.required'     => 'Môn học không được để trống!',
            'subject_detail.max'       => 'Tên Môn học tối đa 20 kí tự!',
            'subject_detail.unique'       => 'Môn học đặt trên dữ liệu!',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 422);
        }
        $result = [];
        $name = $request->input('subject_detail');
        if ($name !== null) {
            $mon = new subjects([
                'subject_detail' => $name
            ]);
            if ($mon->save()) {
                $result = $mon->toArray();
                $result['status_value'] = "Thêm thành công!";
                $result['status'] = 1;
            } else {
                $result['status_value'] = "Lỗi! Môn học đã tồn tại!";
                $result['status'] = 0;
            }
        } else {
            $result['status_value'] = "Lỗi! Tên môn học không được trống!";
            $result['status'] = 0;
        }
        return response()->json([
            'result' => $result,
        ]);
    }
    public function search(Request $request)
    {
        $keySearch = $request->key_search;

        $data = subjects::where('subject_id', 'like', '%' . $keySearch . '%')
                    ->orWhere('subject_detail', 'like', '%' . $keySearch . '%')
                    ->get();

        return response()->json([
            'data' => $data
        ]);
    }

}
