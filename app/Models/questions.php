<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Facades\DB;

class questions extends  Model
{
    protected $table = 'questions';
    protected $fillable = [
        'question_id',
        'grade_id',
        'unit' ,
        'level_id' ,
        'question_content',
        'answer_a',
        'answer_b',
        'answer_c',
        'answer_d',
        'correct_answer',
        'subject_id' ,
        'teacher_id' ,
        'status_id' ,
        'suggest',
        'chapter_id',
        'answer_is_true',
        'answer_is_false',
        'multimedia'
    ];
    public $timestamps = false;
    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }
    public function studentPracticeDetails()
    {
        return $this->hasMany(student_practice_detail::class, 'question_id', 'question_id');
    }
    protected $primaryKey = 'question_id';
    function getQuestion()
    {
        $getAllQuestion = DB::select('select * from questions');
        return $getAllQuestion;
    }
    public function tests():BelongsToMany{
        return $this->belongsToMany(tests::class, 'quest_of_test', 'question_id', 'test_code');
    }
     public function practices():BelongsToMany{
        return $this->belongsToMany(practice::class, 'quest_of_practice', 'question_id', 'practice_code');
    }

}
