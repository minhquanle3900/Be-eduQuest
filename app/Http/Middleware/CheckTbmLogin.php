<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckTbmLogin
{

    public function handle(Request $request, Closure $next)
    {
        $check = Auth::guard('apiTBM')->user();
        if ($check) {
            if ($check->permission === 4) {
                return $next($request);
            } else {
                return response()->json(['message' => 'Permission denied'], 403);
            }
        } else {
            return redirect('/api/TBM/login');
        }
    }
}
