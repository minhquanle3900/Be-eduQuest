<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

class CheckTeacher
{
    public function handle(Request $request, Closure $next)
    {

      if(!$request->user('teachers')){
            return response()->json(['message' => 'You are unauthorize for this route'],403);
    }
    $request->id = $request->user('teachers')->teacher_id;
        return $next($request);
    }
}
