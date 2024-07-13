<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use  Illuminate\Support\Facades\Auth;

class CheckStudent
{
    public function handle(Request $request, Closure $next)
    {
        if(!$request->user('students')){
            return response()->json(['message' => 'You are unauthorize for this route'],403);
    }
    $request->id = $request->user('students')->student_id;
        return $next($request);

}
}
