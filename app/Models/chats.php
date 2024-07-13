<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class chats extends Model
{
    protected $table = "chats";

    protected $fillable = [
        'ID',
        'username',
        'name',
        'time_sent',
        'chat_content',
        'class_id'
    ];
    protected $primaryKey = 'ID';
    public $timestamps = false;
}
