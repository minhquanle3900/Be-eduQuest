<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;

class student_test_detail extends  Model
{
    use Notifiable;

    protected $table = 'student_test_detail';

    protected $fillable = [
        'ID',
        'student_id',
        'test_code',
        'question_id',
        'answer_a',
        'answer_b',
        'answer_c',
        'answer_d',
        'student_answer',
        'timest'
    ];
    public $incrementing = false;
    public $timestamps = false;



}
