<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

class CheckHeadSubject
{
    public function handle(Request $request, Closure $next)
    {

        if(!$request->user('subject_heads')){
            return response()->json(['message' => 'You are unauthorize for this route'],403);
    }
    $request->id = $request->user('subject_heads')->admin_id;
        return $next($request);
    }
}
