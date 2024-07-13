<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class quest_of_practice extends Model
{
    protected $table = 'quest_of_practice';
    protected $fillable = [
       'practice_code',
       'question_id',
    ];
    public $timestamps = false;

}
