<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class classes extends Model
{
    protected $table = 'classes';
    protected $fillable = [
        'class_id',
        'grade_id',
        'class_name',
        'teacher_id'
    ];
    public $timestamps = false;
    protected $primaryKey = 'class_id';
    public function students()
    {
        return $this->hasMany(Student::class, 'class_id', 'class_id');
    }
    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }
}
