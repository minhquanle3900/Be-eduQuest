<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Symfony\Component\Console\Question\Question;

class admin extends  Authenticatable implements JWTSubject
{
    use Notifiable;
    protected $table = 'admins';
    protected $fillable = [
        'admin_id',
        'username',
        'email',
        'password',
        'name',
        'permission',
        'last_login',
        'gender_id',
        'avatar',
        'birthday',
        'otp',
        'otp_expiry',
        'password_change_time',
    ];


    public $timestamps = false;
    protected $primaryKey = 'admin_id';

    //
    function getAdmin()
    {
        $getAllAdmin = DB::select('select * from admins');
        return $getAllAdmin;
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
    protected $hidden = [
        'password',
    ];

    public function subject()
    {
        return $this->hasOne(subjects::class, 'subject_id');
    }
    public function getCountQuestions($subject_id, $grade_id)
    {
        return DB::table('questions')
        ->rightJoin('subjects', 'subjects.subject_id', '=', 'questions.subject_id')
        ->rightJoin('grades', 'grades.grade_id', '=', 'questions.grade_id')
        ->select(
            DB::raw('COUNT(questions.question_id) as question_count'),
            'subjects.subject_detail as subject_detail',
            'grades.detail as grade_detail'
        )
            ->where('subjects.subject_id', $subject_id)
            ->where('grades.grade_id', $grade_id)
            ->where('status_id', 4)
            ->groupBy('subjects.subject_detail', 'grades.detail')
            ->first();
    }

    public function calculateQuestionLevel($totalQuestion, $level_test)
    {
        $easyQuestion = $middleQuestion = $hardQuestion = 0;

        if ($level_test == 1) {
            $easyQuestion = (int) round($totalQuestion * 0.6);
            $middleQuestion = (int) round($totalQuestion * 0.2);
            $hardQuestion = $totalQuestion - $easyQuestion - $middleQuestion;
        } elseif ($level_test == 2) {
            $middleQuestion = (int) round($totalQuestion * 0.6);
            $easyQuestion = (int) round($totalQuestion * 0.2);
            $hardQuestion = $totalQuestion - $easyQuestion - $middleQuestion;
        } else {
            $hardQuestion = (int) round($totalQuestion * 0.6);
            $easyQuestion = (int) round($totalQuestion * 0.2);
            $middleQuestion = $totalQuestion - $easyQuestion - $hardQuestion;
        }

        $listQuestion = [
            '1' => $easyQuestion,
            '2' => $middleQuestion,
            '3' => $hardQuestion
        ];

        return $listQuestion;
    }

    public function caculatorQuestionNormal($questionEasy, $questionAverage, $questionDifficult)
    {
        $list_question = [
            '1' => $questionEasy,
            '2' => $questionAverage,
            '3' => $questionDifficult
        ];
        return $list_question;
    }

    public function getListQuestByLevel($gradeId, $subjectId, $levelId, $limit)
    {
        return DB::table('questions')
        ->where('grade_id', $gradeId)
            ->where('subject_id', $subjectId)
            ->where('level_id', $levelId)
            ->inRandomOrder()
            ->limit($limit)
            ->get();
    }

    public function addQuestToTest($testCode, $questionId)
    {
        $questOfTest = new quest_of_test();
        $questOfTest->test_code = $testCode;
        $questOfTest->question_id = $questionId;
        return $questOfTest->saveQuietly();
    }

}
