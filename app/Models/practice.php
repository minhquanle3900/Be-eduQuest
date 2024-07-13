<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class practice extends Model
{
    protected $table = 'practice';

    protected $fillable = [
        'practice_code',
        'grade_id',
        'subject_id',
        'level_id',
        'time_to_do',
        'total_question',
        'teacher_id',
        'practice_name'
    ];
     protected $primaryKey = 'practice_code';
     public $timestamps = false;

    public function questions():BelongsToMany
    {
        return $this->belongsToMany(questions::class, 'quest_of_practice', 'practice_code', 'question_id');
    }
    public function subject()
    {
        return $this->belongsTo(subjects::class, 'subject_id');
    }
}
