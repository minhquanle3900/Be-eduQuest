<?php

namespace App\Models;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class students extends Authenticatable implements JWTSubject
{
    use Notifiable;
    protected $table = 'students';
    protected $fillable = [
        'student_id',
        'name',
        'username',
        'gender_id',
        'password',
        'email',
        'permission',
        'avatar',
        'birthday',
        'class_id',
        'last_login',
    ];
    public $timestamps = false;
    protected $primaryKey = 'student_id';


    function getHS()
    {
        // $getAllHS = DB::select('select * from students');
        // return $getAllHS;
    }
     public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
}
