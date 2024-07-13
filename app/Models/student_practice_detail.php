<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;

class student_practice_detail extends Model
{
    use HasFactory;

    protected $table = 'student_practice_detail';

    protected $fillable = [
        'ID',
        'student_id',
        'practice_code',
        'question_id',
        'answer_a',
        'answer_b',
        'answer_c',
        'answer_d',
        'student_answer',
        'timest'
    ];
    public $timestamps = false;

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    public function getPractice($practice_code)
    {
        $practice = DB::table('practice')
            ->where('practice_code', $practice_code)
            ->first();

        return $practice;
    }



    public function getQuestOfPractice($practice_code)
    {
        $result =
        quest_of_practice::where('practice_code', $practice_code)
            ->join('questions', 'questions.question_id', '=', 'quest_of_practice.question_id')
            ->inRandomOrder()
            ->get();

        return $result;
    }

    public function  addStudentQuest($student_id, $ID, $practice_code, $question_id, $answer_a, $answer_b, $answer_c, $answer_d)
    {

        $status = DB::table('student_practice_detail')->insert([
            'student_id' => $student_id,
            'ID' => $ID,
            'practice_code' => $practice_code,
            'question_id' => $question_id,
            'answer_a' => $answer_a,
            'answer_b' => $answer_b,
            'answer_c' => $answer_c,
            'answer_d' => $answer_d
        ]);

        return $status;
    }

    public function updateStudentExam($ID, $practice_code, $time)
    {
        $status = DB::table('students')
        ->where('student_id', $ID)
        ->update([
            'doing_exam' => $practice_code,
            'time_remaining' => $time,
            'starting_time' => now()
        ]);

        return $status;
    }
    public function question()
    {
        return $this->belongsTo(questions::class, 'question_id', 'question_id');
    }
}
