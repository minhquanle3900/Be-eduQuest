<?php

namespace App\Rules;

use App\Models\admin;
use App\Models\student;
use App\Models\subject_head;
use App\Models\teacher;
use Illuminate\Contracts\Validation\Rule;

class UniqueNameAcrossModels implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        return admin::where('name', $value)->exists()
            || subject_head::where('name', $value)->exists()
            || teacher::where('name', $value)->exists()
            || student::where('name', $value)->exists();
    }

    public function message()
    {
        return 'Tên đã tồn tại trong hệ thống!';
    }
}
