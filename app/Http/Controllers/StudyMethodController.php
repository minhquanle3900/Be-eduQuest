<?php

namespace App\Http\Controllers;

use App\Models\student;
use App\Services\GPT3Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class StudyMethodController extends Controller
{
    protected $gpt3Service;

    public function __construct(GPT3Service $gpt3Service)
    {
        $this->gpt3Service = $gpt3Service;
    }
    public function index()
    {
        return view('study-methods.index');
    }
    public function suggestStudyMethods(Request $request)
    {
        $message = $request->input('message');

        $apiKey = env('OPENAI_API_KEY');

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $apiKey,
            'Content-Type' => 'application/json',
        ])->post('https://api.openai.com/v1/completions', [
            'model' => 'text-davinci-003',
            'prompt' => $message,
            'max_tokens' => 150,
            'temperature' => 0.7,
        ]);

        return response()->json($response->json());
    }

}
