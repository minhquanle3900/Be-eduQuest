<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;

class CheckStudentToken
{
    public function handle(Request $request, Closure $next)
    {
        $check = Auth::guard('apiStudents')->user();
        if ($check) {
            if ($check->permission === 3) {
                return $next($request);
            } else {
                return response()->json(['message' => 'Permission denied'], 403);
            }
        } else {
            return redirect('/api/admin/login');
        }
    }
}
