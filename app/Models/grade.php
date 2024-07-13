<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class grade extends Model
{
    protected $table = 'grades';

    protected $fillable = [
        'grade_id',
        'detail',
    ];
}
