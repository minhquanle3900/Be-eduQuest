<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class tests extends  Model {
    protected $table = 'tests';
    protected $fillable = [
        'test_code',
        'test_name',
        'password',
        'subject_id',
        'grade_id',
        'level_id',
        'total_questions',
        'time_to_do',
        'note',
        'status_id',
        'timest',
        'teacher_id'
    ];
    public $timestamps = false;
    protected $primaryKey = 'test_code';
    public function scores()
    {
        return $this->hasMany(Scores::class, 'test_code', 'test_code');
    }
       public function questions():BelongsToMany
    {
        return $this->belongsToMany(questions::class, 'quest_of_test', 'test_code', 'question_id');
    }
    public function subject()
    {
        return $this->belongsTo(subjects::class, 'subject_id');
    }
    public function grade()
    {
        return $this->belongsTo(grade::class, 'grade_id');
    }
    protected static function booted () {
        static::deleting(function(tests $test) { // before delete() method call this
            quest_of_test::where('test_code', $test->test_code)->delete();
            $test->questions()->detach();
        });
    }
}
