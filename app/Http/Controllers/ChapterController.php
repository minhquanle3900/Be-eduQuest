<?php

namespace App\Http\Controllers;

use App\Models\Chapter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ChapterController extends Controller
{
    public function getChapter()
    {
        $data = Chapter::get();
        if ($data->isEmpty()) {
            return response()->json([
                'status' => false,
                'message' => 'No chapter found!',
            ], 400);
        }
        return response()->json([
            'data'    => $data,
        ], 200);
    }

    public function createChapter(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'chapter_name' => 'required',
            'chapter_description' => 'required',
            'chapter_image' => 'required',
            'subject_id' => 'required',
        ], [
            'chapter_name.required' => 'Vui lòng nhập tên chapter.',
            'chapter_description.required' => 'Vui lòng nhập mô tả chapter.',
            'chapter_image.required' => 'Vui lòng chọn hình ảnh chapter.',
            'subject_id.required' => 'Vui lòng chọn môn học.',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ], 400);
        }
        $data = Chapter::create($request->all());
        return response()->json([
            'data'    => $data,
        ], 200);
    }

    public function updateChapter(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'chapter_name' => 'required',
            'chapter_description' => 'required',
            'chapter_image' => 'required',
            'subject_id' => 'required',
        ], [
            'chapter_name.required' => 'Vui lòng nhập tên chapter.',
            'chapter_description.required' => 'Vui lòng nhập mô tả chapter.',
            'chapter_image.required' => 'Vui lòng chọn hình ảnh chapter.',
            'subject_id.required' => 'Vui lòng chọn môn học.',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ], 400);
        }
        $data = Chapter::where('id', $request->id)->update($request->all());
        return response()->json([
            'data'    => $data,
        ], 200);
    }
    public function deleteChapter(Request $request)
    {
        $id = $request->id;
        $chapter = Chapter::find($id);
        if ($chapter) {
            $chapter->delete();
            return response()->json(['message' => 'Chapter deleted successfully.'], 200);
        } else {
            return response()->json(['message' => 'Chapter not found.'], 400);
        }
    }
}
