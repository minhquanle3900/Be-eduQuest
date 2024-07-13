<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class scores extends Model
{
    protected $table = 'scores';

    protected $fillable = [
        'student_id',
        'test_code',
        'score_number',
        'score_detail',
        'completion_time'
    ];
    public $timestamps = false;
    public function student()
    {
        return $this->belongsTo(Student::class, 'student_id', 'student_id');
    }

    public function test()
    {
        return $this->belongsTo(tests::class, 'test_code', 'test_code');
    }
}
