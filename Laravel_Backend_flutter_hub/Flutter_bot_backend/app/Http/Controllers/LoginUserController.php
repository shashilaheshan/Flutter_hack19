<?php

namespace App\Http\Controllers;

use App\UserModel;
use Illuminate\Http\Request;

class LoginUserController extends Controller
{



    public function AuthUser(Request $re){

        $user = UserModel::where('email', '=', $re->email)->where('password','=',$re->password)->first();
        if($user){
            return response()->json(['data'=>$user]);

        }
        else{

            return response()->json(['data'=>'error']);
        }








    }
}
