<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('/register_user',[

    'uses'=>'RegisterControllerUser@registeruser'

]);

Route::post('/login_user',[

    'uses'=>'LoginUserController@AuthUser'

]);

Route::post('/add_category',[

 'uses'=>'CategoryController@addcategory'
]);

Route::post('/add_post',[

    'uses'=>'PostController@add_post'
]);

Route::post('/add_comment',[

    'uses'=>'PostController@add_comment'
]);

Route::get('/all_posts',[

    'uses'=>'PostController@getAll'
]);

Route::get('/get_single_post/{id}',[

    'uses'=>'PostController@getSinglePost'
]);



Route::get('/get_single_post_comment',[


    'uses'=>'PostController@getPostComment'

]);