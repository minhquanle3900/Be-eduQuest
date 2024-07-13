<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\User as Authenticatable;

class subjects extends Model
{
    protected $table = 'subjects';
    protected $fillable = [
        'subject_id',
        'subject_detail',
    ];
    public $timestamps = false;
    protected $primaryKey = 'subject_id';


    function getMon()
    {
        $getAllMon = DB::select('select * from subjects');
        return $getAllMon;
    }
    // public function practices()
    // {
    //     return $this->hasMany(Practice::class, 'subject_id');
    // }
}
