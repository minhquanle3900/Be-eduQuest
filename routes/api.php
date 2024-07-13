<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminClassController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Admincontroller;
use App\Http\Controllers\AdminTBMonController;
use App\Http\Controllers\AdminMonHocController;
use App\Http\Controllers\AdminTeacherController;
use App\Http\Controllers\StatistController;
use App\Http\Controllers\TeacherConTroller;
use App\Http\Controllers\AdminHSController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TBMDuyetDeThiController;
use App\Http\Controllers\AdminNotificationController;
use App\Http\Controllers\ChapterController;
use App\Http\Controllers\ProfileController;

Route::post('login',[AuthController::class, 'login']);
Route::post('forget-password', [AuthController::class, 'forgetPassword']);
Route::post('verify-otp-and-reset-password', [AuthController::class, 'verifyOtpAndResetPassword']);
Route::get('me', [AuthController::class, 'me']);
Route::post('/update-profile',     [ProfileController::class, 'updateProfile']);
Route::get('/get-subjects', [Admincontroller::class, 'getSubjects'])->name('getSubjects');
Route::post('question/search', [Admincontroller::class, 'search'])->name('search');
// ----- Route for Admin -----
Route::group(['prefix' => '/admin', 'middleware' => 'admin'], function () {
    //ql Admi
    Route::group(['prefix' => 'admin'], function () {
        Route::get('/get', [Admincontroller::class, 'getAdmin'])->name('getAdmin');
        Route::post('/create', [AdminController::class, 'createAdmin'])->name('createAdmin');
        Route::delete('/delete', [AdminController::class, 'deleteAdmin'])->name('deleteAdmin');
        Route::put('/update', [AdminController::class, 'updateAdmin'])->name('updateAdmin');
        Route::post('/file', [AdminController::class, 'check_add_admin_via_file'])->name('admin.check_add_admin_via_file');
    });

    //Chapter
    Route::group(['prefix' => 'chapter'], function () {
        Route::get('/get', [ChapterController::class, 'getChapter'])->name('getChapter');
        Route::post('/create', [ChapterController::class, 'createChapter'])->name('createChapter');
        Route::delete('/delete', [ChapterController::class, 'deleteChapter'])->name('deleteChapter');
        Route::put('/update', [ChapterController::class, 'updateChapter'])->name('updateChapter');
    });

    //ql Question
    Route::group(['prefix' => 'question'], function () {
        Route::post('/create', [Admincontroller::class, 'checkAddQuestions'])->name('checkAddQuestion');
        Route::get('/get', [Admincontroller::class, 'getQuestion'])->name('getQuestion');
        Route::put('/update', [Admincontroller::class, 'updateQuestions'])->name(('updateQuestions'));
        Route::delete('/delete', [Admincontroller::class, 'deleteQuestion'])->name(('deleteQuestion'));
        Route::get('/get-grade', [Admincontroller::class, 'getGrades'])->name('getGrade');
        Route::get('/get-status', [Admincontroller::class, 'getStatus'])->name('getStatus');
        Route::get('/get-level', [Admincontroller::class, 'getLevels'])->name('getLevel');

        Route::post('/file', [AdminController::class, 'checkAddQuestionViaFile'])->name('admin.check_add_question_via_file');
    });
    //  ql test
    Route::group(['prefix' => 'test'], function () {
        Route::post('/create', [Admincontroller::class, 'checkAddTest'])->name(('checkAddTest'));
        Route::get('/get', [Admincontroller::class, 'getTest'])->name(('getTest'));
        Route::get('/get/{test_code}', [Admincontroller::class, 'getTestDetail'])->name(('getTestDetail'));
        Route::put('/update/{test_code}', [Admincontroller::class, 'updateTest'])->name(('changeStatus'));
    });

    //Thống Kê
    Route::group(['prefix' => 'statist'], function () {
        Route::get('/',[StatistController::class, 'statist'])->name('statist');
        Route::get('/scores',[StatistController::class, 'statistScores'])->name('statistScores');
        Route::get('/all',[StatistController::class, 'allAdminPage'])->name('allAdminPage');
        Route::get('/test-seven',[StatistController::class, 'statistTestSevenDay'])->name('statistTestSevenDay');
        Route::get('/visit-seven', [StatistController::class, 'visitStatistsSevenDay'])->name('visitStatistsSevenDay');
        Route::get('/scores-high-seven',[StatistController::class, 'statistHighScoresSevenDay'])->name('statistHighScoresSevenDay');
        Route::get('/scores-seven',[StatistController::class, 'statistScoresSevenDay'])->name('statistScoresSevenDay');
    });
    //ql Teacher
    Route::group(['prefix' => 'teacher'], function () {
        Route::get('/get',     [AdminTeacherController::class, 'getTeacher'])->name('getTeacher');
        Route::delete('/delete', [AdminTeacherController::class, 'destroy'])->name('destroyTeacher');
        Route::put('/update',   [AdminTeacherController::class, 'edit'])->name('editTeacher');
        Route::post('/create', [AdminTeacherController::class, 'create'])->name('createTeacher');
        Route::post('/search', [AdminTeacherController::class, 'search'])->name('searchTeacher');
        Route::post('/delete-check-box', [AdminTeacherController::class, 'deleteCheckbox'])->name('deleteCheckbox');
        Route::post('/file', [AdminTeacherController::class, 'createFileTeacher'])->name('createFileTeacher');
    });

    //ql Class
    Route::group(['prefix' => 'class'], function () {
        Route::get('/get',     [AdminClassController::class, 'getClasses'])->name('getClasses');
        Route::delete('/delete', [AdminClassController::class, 'destroy'])->name('destroyClass');
        Route::put('/update',   [AdminClassController::class, 'edit'])->name('editClass');
        Route::post('/create', [AdminClassController::class, 'create'])->name('createClass');
        Route::post('/search', [AdminClassController::class, 'search'])->name('searchClass');
    });

    //ql TBM
    Route::group(['prefix' => '/subject-head'], function () {
        Route::get('/get', [AdminTBMonController::class, 'index'])->name('index');
        Route::put('/update', [AdminTBMonController::class, 'updateTBM'])->name('updateTBM');
        Route::post('/create', [AdminTBMonController::class, 'createTBM'])->name('createTBM');
        Route::delete('/delete', [AdminTBMonController::class, 'deleteTBM'])->name('deleteTBM');
        Route::post('/file', [AdminTBMonController::class, 'check_add_tbm_via_file'])->name('check_add_tbm_via_file');
    });

    //ql Môn học
    Route::group(['prefix' => '/subject'], function () {
        Route::get('/get', [AdminMonHocController::class, 'index'])->name('index');
        Route::post('/create', [AdminMonHocController::class, 'createMon'])->name('createMon');
        Route::delete('/delete', [AdminMonHocController::class, 'deleteMon'])->name('deleteMon');
        Route::put('/update', [AdminMonHocController::class, 'updateMon'])->name('updateMon');
        Route::post('/search', [AdminMonHocController::class, 'search'])->name('search');
    });

    //ql học sinh
    Route::group(['prefix' => '/student'], function () {
        Route::get('/get', [AdminHSController::class, 'index'])->name('index');
        Route::post('/create', [AdminHSController::class, 'createHS'])->name('createHS');
        Route::delete('/delete', [AdminHSController::class, 'deleteHS'])->name('deleteHS');
        Route::put('/update', [AdminHSController::class, 'updateHS'])->name('updateHS');
        Route::post('/file', [AdminHSController::class, 'check_add_hs_via_file'])->name('check_add_hs_via_file');
    });

    //thông báo
    Route::group(['prefix' => '/notification'], function () {
        Route::get('/list-teacher', [AdminNotificationController::class, 'listNotificationGV'])->name('listNotificationGV');
        Route::get('/list-student', [AdminNotificationController::class, 'listNotificationHS'])->name('listNotificationHS');
        Route::post('/send', [AdminNotificationController::class, 'sendNotification'])->name('sendNotification');
        Route::post('/send-all-teacher', [AdminNotificationController::class, 'sendAllTeacher'])->name('sendAllTeacher');
        Route::post('/send-all-classes', [AdminNotificationController::class, 'sendAlClasses'])->name('sendAlClasses');
    });
});

// ----- Route for Student -----
Route::group(['prefix' => '/student','middleware' => 'student'], function () { //
    //Thống kê
    Route::group(['prefix' => 'statist'], function () {
        Route::get('/get',         [StatistController::class, 'statistStudent'])->name('statistStudent');
        Route::get('/subject-score', [StatistController::class, 'subjectScore'])->name('subjectScore');
        Route::get('/list-all', [StatistController::class, 'allStudentPage'])->name('allStudentPage');
    });

    // Test
    Route::group(['prefix' => '/test'], function () {
        Route::get('/get', [StudentController::class, 'getTest'])->name('getTest');
        Route::get('/get/{test_code}', [StudentController::class, 'getTestDetail'])->name('getTestDetail');
        Route::post('/start', [StudentController::class, 'beginDoingTest'])->name('beginDoingTest');
        Route::post('/answer', [StudentController::class, 'updateAnswer'])->name('updateAnswer');
        Route::post('/submit', [StudentController::class, 'submitTest'])->name('submitTest');
    });

    // student practice
    Route::group(['prefix' => '/practice'], function () {
        Route::get('/get', [StudentController::class, 'getPractice'])->name('getPractice');
        Route::get('/get/{practice_code}', [StudentController::class, 'getPracticeDetail'])->name('acceptTest');
        Route::post('/start', [StudentController::class, 'startDoingPractice'])->name('startDoingPractice');
        Route::post('/answer', [StudentController::class, 'updatePraceticeAnswer'])->name('updatePraceticeAnswer');
        Route::post('/submit', [StudentController::class, 'submitPractice'])->name('submitPractice');
        Route::get('/result', [StudentController::class, 'getPracticeScore'])->name('resultPractice');
        Route::get('/result/{practice_code}', [StudentController::class, 'getResultPractice'])->name('getResultPractice');
    });

    Route::group(['prefix'=> 'score'], function () {
        Route::get('/get', [StudentController::class, 'getScore'])->name('getScore');
        Route::get('/result', [StudentController::class, 'resultTest'])->name('resultTest');
        Route::get('/get-all-score', [StudentController::class, 'getAllScore'])->name('getAllScore');
    });

    Route::group(['prefix' => 'chat'], function () {
        Route::get('/get', [StudentController::class, 'getChat'])->name('listChat');
        Route::get('/all', [StudentController::class, 'getAllChat'])->name('listAllChat');
        Route::post('/send', [StudentController::class, 'sendChat'])->name('sendChat');
        Route::delete('/un-sent', [StudentController::class, 'unSent'])->name('unSent');
        Route::put('/edit', [StudentController::class, 'editChat'])->name('editChat');
    });

    //xem danh sách thông báo
    Route::get('/notification', [StudentController::class, 'notifications'])->name('notifications');
});

// ----- Route for Teacher -----
Route::group(['prefix' => '/teacher', 'middleware' => 'teacher'], function () {
    // teacher qly test
    Route::group(['prefix' => '/test'], function () {
        // teacher quan ly de thi
        Route::get('/get', [TeacherConTroller::class, 'getTest'])->name('teacherGetTest');
        Route::get('/get/{test_code}', [TeacherConTroller::class, 'getTestDetail'])->name('teacherGetTestDetail');
        Route::post('/create', [TeacherConTroller::class, 'createTest'])->name('teacherCreateTest');
        Route::put('/update/{test_code}', [TeacherConTroller::class, 'updateTest'])->name('teacherUpdateTest');
        Route::delete('/delete/{test_code}', [TeacherConTroller::class, 'deleteTest'])->name('teacherDeleteTest');
        Route::post('/search', [TeacherConTroller::class, 'searchOfTest'])->name('teachersearchOfTest');
        Route::post('/file', [TeacherConTroller::class, 'addFileTest'])->name('teacheraddFileTest');
    });
    Route::group(['prefix' => '/practice'], function () {
        Route::get('/get', [TeacherConTroller::class, 'getPractice'])->name('teacherGetTest');
        Route::get('/get/{practice_code}', [TeacherConTroller::class, 'getPracticeDetail'])->name('teacherGetTestDetail');
        Route::post('/create', [TeacherConTroller::class, 'createPractice'])->name('teacherCreateTest');
        Route::delete('/delete/{practice_code}', [TeacherConTroller::class, 'deleteTest'])->name('teacherDeleteTest');
    });

    // qly câu hỏi
    Route::group(['prefix' => '/question'], function () {
        Route::post('/create', [TeacherConTroller::class, 'addQuestion'])->name('addQuestion');
        Route::post('/create-two', [TeacherConTroller::class, 'addQuestionTwo'])->name('addQuestionTwo');
        Route::get('/get', [TeacherConTroller::class, 'getQuestion'])->name('addQuestion');
        Route::get('/getTotal', [TeacherConTroller::class, 'getTotalQuestions'])->name('addQuestion');
        Route::delete('/delete', [TeacherConTroller::class, 'destroyQuestion'])->name('destroyQuestion');
        Route::put('/update', [TeacherConTroller::class, 'updateQuestion'])->name('updateQuestion');
        Route::post('/multi-delete-question', [TeacherConTroller::class, 'multiDeleteQuestion'])->name('multiDeleteQuestion');
        Route::post('/file', [TeacherConTroller::class, 'addFileQuestion'])->name('addFileQuestion');
        Route::post('/search', [TeacherConTroller::class, 'searchOfTeacher'])->name('searchOfTeacher');
    });

    //Thống kê
    Route::get('/statist/list-all/{teacher_id}', [StatistController::class, 'allTeacherPage'])->name('allTeacherPage');

    // qly điểm
    Route::group(['prefix' => '/score'], function () {
        Route::get('/get', [TeacherConTroller::class, 'getScore'])->name('getScore');
        Route::post('/export', [TeacherConTroller::class, 'exportScore'])->name('exportScore');
    });

    // qly lớp
    Route::group(['prefix' => '/class'], function () {
        Route::get('/get', [TeacherConTroller::class, 'getClass'])->name('getClass');
        Route::get('/get/{class_id}', [TeacherConTroller::class, 'getStudentOfClass'])->name('getClass');
    });
    Route::group(['prefix' => '/student'], function () {
        Route::get('/get', [TeacherConTroller::class, 'getStudent'])->name('getStudent');
        Route::get('/detail', [TeacherConTroller::class, 'detailStudent'])->name('detailStudent');
        Route::get('/result/{test_code}', [TeacherConTroller::class, 'getResultClass'])->name('getResultClass');
    });
    // Thông báo
    Route::group(['prefix' => '/notification'], function () {
        Route::get('/to-student', [TeacherConTroller::class, 'notificationsToStudent'])->name('notificationsToStudent');
        Route::get('/by-admin', [TeacherConTroller::class, 'notificationsByAdmin'])->name('notificationsByAdmin');
        Route::post('/send', [TeacherConTroller::class, 'sendNotification'])->name('sendNotification');
    });
});

// ----- Route for Subject_Head -----
Route::group(['prefix' => '/subject-head', 'middleware' => 'head_subject'], function () {

    Route::get('/statist/list-all/{subject_head_id}', [StatistController::class, 'allHeadPage'])->name('allHeadPage');

    //duyệt đề thi
    Route::group(['prefix' => '/test'], function () {
        Route::get('/get', [TBMDuyetDeThiConTroller::class, 'getTests'])->name('getTest');
        Route::get('/get/{test_code}', [TBMDuyetDeThiConTroller::class, 'getTestDetail'])->name('duyetDT');
        Route::put('/update/{test_code}', [TBMDuyetDeThiConTroller::class, 'updateTest'])->name('updateTest');
        Route::post('/duyet', [TBMDuyetDeThiConTroller::class, 'duyetDT'])->name('duyetDT');
    });
});
