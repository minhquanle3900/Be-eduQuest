<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class databaseAdmin extends Model
{
    // protected $table = 'admins';

    // protected $fillable = [
    //     'admin_id',
    //     'username',
    //     'email',
    //     'password',
    //     'name',
    //     'permission',
    //     'last_login',
    //     'gender_id',
    //     'avatar',
    //     'birthday'
    // ];

    // public function __construct(array $attributes = [])
    // {
    //     parent::__construct($attributes);
    // }

    // // Hàm thiết lập câu truy vấn
    // public function set_query($sql)
    // {
    //     // Không cần làm gì ở đây vì chúng ta không sử dụng SQL trực tiếp với Eloquent ORM
    //     // Nếu bạn muốn xử lý câu truy vấn SQL tùy chỉnh, bạn có thể sử dụng Query Builder của Laravel
    // }

    // // Hàm thực hiện câu lệnh SQL và trả về tất cả các hàng dưới dạng mảng các đối tượng
    // public function load_rows()
    // {
    //     return DB::select($this->sql);
    // }

    // // Hàm thực hiện câu lệnh SQL và trả về một hàng dưới dạng đối tượng
    // public function load_row()
    // {
    //     $rows = $this->load_rows();
    //     return count($rows) > 0 ? $rows[0] : null;
    // }

    // // Hàm thực thi câu lệnh SQL và trả về true hoặc false
    // public function execute_return_status()
    // {
    //     try {
    //         DB::statement($this->sql);
    //         return true;
    //     } catch (\Exception $e) {
    //         echo $e->getMessage();
    //         return false;
    //     }
    // }
    //
}
