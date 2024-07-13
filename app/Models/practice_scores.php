<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class practice_scores extends Model
{
    protected $table = 'practice_scores';

    protected $fillable = [
        'student_id',
        'practice_code',
        'score_number',
        'score_detail',
        'completion_time'
    ];
    public $timestamps = false;
}
