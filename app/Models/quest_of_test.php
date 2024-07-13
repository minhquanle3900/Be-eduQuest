<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class quest_of_test extends  Model
{
    protected $table = 'quest_of_test';
    protected $fillable = [
       'test_code',
       'question_id',
       'timest',
       'teacher_id'
    ];
    public $timestamps = false;
    // public function test()
    // {
    //     return $this->belongsTo(tests::class, 'test_code');
    // }
    // public function question()
    // {
    //     return $this->hasOne(questions::class, 'question_id');
    // }


}
