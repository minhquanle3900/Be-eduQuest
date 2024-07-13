<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;

class student extends  Authenticatable implements JWTSubject
{
    use Notifiable;

    protected $table = 'students';

    protected $fillable = [
        'student_id',
        'username',
        'email',
        'password',
        'name',
        'permission',
        'class_id',
        'last_login',
        'gender_id',
        'avatar',
        'birthday',
        'doing_exam',
        'starting_time',
        'time_remaining',
        'doing_practice',
        'practice_time_remaining',
        'practice_starting_time',
        'otp',
        'otp_expiry',
        'password_change_time',
        'muc_tieu'
    ];

    protected $primaryKey = 'student_id';
    protected $hidden = [
        'password',
    ];
    public $timestamps = false;
    public function classes()
    {
        return $this->belongsTo(classes::class, 'class_id', 'class_id');
    }

    public function scores()
    {
        return $this->hasMany(Scores::class, 'student_id', 'student_id');
    }
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    public function getTest($testCode)
    {
        $test = DB::table('tests')
            ->where('test_code', $testCode)
            ->first();

        return $test;
    }

    public function getQuestOfTest($testCode)
    {
        $result =
            quest_of_test::where('test_code', $testCode)
            ->join('questions', 'questions.question_id', '=', 'quest_of_test.question_id')
            ->inRandomOrder()
            ->get();

        return $result;
    }

    public function  addStudentQuest($student_id, $ID, $testCode, $question_id, $answer_a, $answer_b, $answer_c, $answer_d)
    {

        $status = DB::table('student_test_detail')->insert([
            'student_id' => $student_id,
            'ID' => $ID,
            'test_code' => $testCode,
            'question_id' => $question_id,
            'answer_a' => $answer_a,
            'answer_b' => $answer_b,
            'answer_c' => $answer_c,
            'answer_d' => $answer_d
        ]);

        return $status;
    }

    public function updateStudentExam($ID, $testCode, $time)
    {
        return DB::table('students')
            ->where('student_id', $ID)
            ->update([
                'doing_exam' => $testCode,
                'time_remaining' => $time,
                'starting_time' => now()
            ]);
    }
    //practice
    public function getQuestOfPratice($practice_code)
    {
        return quest_of_practice::where('practice_code', $practice_code)
            ->join('questions', 'questions.question_id', '=', 'quest_of_practice.question_id')
            ->inRandomOrder()
            ->get();
    }

    public function getPractice($practice_code)
    {
        $test = DB::table('practice')
            ->where('practice_code', $practice_code)
            ->first();

        return $test;
    }

    public function addStudentPracticeQuest($student_id, $ID, $practice_code, $question_id, $answer_a, $answer_b, $answer_c, $answer_d)
    {
        $status = DB::table('student_practice_detail')->insert([
            'student_id' => $student_id,
            'ID' => $ID,
            'practice_code' => $practice_code,
            'question_id' => $question_id,
            'answer_a' => $answer_a,
            'answer_b' => $answer_b,
            'answer_c' => $answer_c,
            'answer_d' => $answer_d,
        ]);

        return $status;
    }

    function updateStudentPractice($ID, $practice_code, $time)
    {
        return DB::table('students')
            ->where('student_id', $ID)
            ->update([
                'doing_practice' => $practice_code,
                'practice_time_remaining' => $time,
                'practice_starting_time' => DB::raw('NOW()')
            ]);
    }

    function getResultPracticeQuest($practice_code, $student_id)
    {
        return student_practice_detail::where('student_practice_detail.practice_code', $practice_code)
            ->where('student_practice_detail.student_id', $student_id)
            ->join('questions', 'student_practice_detail.question_id', '=', 'questions.question_id')
            ->join('practice', 'student_practice_detail.practice_code', '=', 'practice.practice_code')
            ->orderBy('ID')
            ->get();
    }

    public function insertPracticeScore($student_id, $practice_code, $score, $score_detail)
    {
        return DB::table('practice_scores')->insert([
            'student_id' => $student_id,
            'practice_code' => $practice_code,
            'score_number' => $score,
            'score_detail' => $score_detail,
            'completion_time' => DB::raw('NOW()')
        ]);
    }

    public function resetDoingPractice($ID)
    {
        return
            DB::table('students')
            ->where('student_id', $ID)
            ->update([
                'doing_practice' => null,
                'practice_time_remaining' => null,
                'practice_starting_time' => null
            ]);
    }
    //



    public function isStudent()
    {
        return $this->role === 'students';
    }

    public function getResultQuest($testCode, $studentId)
    {
        return
            DB::table('student_test_detail')
            ->join('questions', 'student_test_detail.question_id', '=', 'questions.question_id')
            ->join('tests', 'student_test_detail.test_code', '=', 'tests.test_code')
            ->where('student_test_detail.test_code', $testCode)
            ->where('student_id', $studentId)
            ->orderBy('student_test_detail.ID')
            ->get();
    }

    public function insertScore($studentId, $testCode, $score, $scoreDetail)
    {
        DB::table('scores')->insert([
            'student_id' => $studentId,
            'test_code' => $testCode,
            'score_number' => $score,
            'score_detail' => $scoreDetail,
            'completion_time' => now(),
        ]);
    }

    public function resetDoingExam($ID)
    {
        DB::table('students')
            ->where('student_id', $ID)
            ->update([
                'doing_exam' => null,
                'time_remaining' => null,
                'starting_time' => null
            ]);
    }


    //update answer
    public function updateAnswer($studentId, $testCode, $questionId, $studentAnswer)
    {
        return student_test_detail::where('student_id', $studentId)
            ->where('test_code', $testCode)
            ->where('question_id', $questionId)
            ->update(['student_answer' => $studentAnswer]);
    }

    public function updateTiming($studentId, $time)
    {
        return student::where('student_id', $studentId)
            ->update(['time_remaining' => $time]);
    }
}
