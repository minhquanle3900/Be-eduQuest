<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class teacher_notifications extends Model
{
    protected $table = "teacher_notifications";

    protected $fillable = [
        'ID',
        'notification_id',
        'teacher_id'
    ];
    protected $primaryKey = 'ID';

    public $timestamps = false;

}
