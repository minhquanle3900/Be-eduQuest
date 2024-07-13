<?php

return [

    'defaults' => [
        'guard' => 'students',
        'passwords' => 'students',
    ],


    'guards' => [
        'admins' => [
            'driver' => 'jwt',
            'provider' => 'admins',
        ],
        'subject_heads' => [
            'driver' => 'jwt',
            'provider' => 'subject_heads'
        ],
        'teachers' => [
            'driver' => 'jwt',
            'provider' => 'teachers'
        ],
        'students' => [
            'driver' => 'jwt',
            'provider' => 'students'
        ],
    ],


    'providers' => [
        'admins' => [
            'driver' => 'eloquent',
            'model' => App\Models\admin::class,
        ],
         'subject_heads' => [
            'driver' => 'eloquent',
            'model' => App\Models\subject_head::class,
        ],
        'teachers' => [
            'driver' => 'eloquent',
            'model' => App\Models\teacher::class,
        ],
        'students' => [
            'driver' => 'eloquent',
            'model' => App\Models\students::class,
        ],


    // 'guards' => [
    //     'api' => [
    //         'driver' => 'jwt',
    //         'provider' => 'multi',
    //     ],
    // ],

    // 'providers' => [
    //     'multi' => [
    //         'driver' => 'eloquent',
    //         'models' => [
    //             App\Models\admin::class,
    //             App\Models\teacher::class,
    //             App\Models\subject_head::class,
    //             App\Models\student::class,
    //         ],
    //     ],

        // 'users' => [
        //     'driver' => 'database',
        //     'table' => 'users',
        // ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Resetting Passwords
    |--------------------------------------------------------------------------
    |
    | You may specify multiple password reset configurations if you have more
    | than one user table or model in the application and you want to have
    | separate password reset settings based on the specific user types.
    |
    | The expire time is the number of minutes that each reset token will be
    | considered valid. This security feature keeps tokens short-lived so
    | they have less time to be guessed. You may change this as needed.
    |
    */

    'passwords' => [
        'users' => [
            'provider' => 'users',
            'table' => 'password_resets',
            'expire' => 60,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Password Confirmation Timeout
    |--------------------------------------------------------------------------
    |
    | Here you may define the amount of seconds before a password confirmation
    | times out and the user is prompted to re-enter their password via the
    | confirmation screen. By default, the timeout lasts for three hours.
    |
    */

    'password_timeout' => 10800,

];
