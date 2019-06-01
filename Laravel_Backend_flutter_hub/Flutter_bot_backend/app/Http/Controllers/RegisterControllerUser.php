<?php

namespace App\Http\Controllers;

use App\UserModel;
use Illuminate\Http\Request;

class RegisterControllerUser extends Controller
{
    public function registeruser(Request $re){



        $user=new UserModel();
        $user->name=$re->name;
        $user->email=$re->email;
        $user->is_active=1;
        $user->password=$re->password;
        $user->save();



        return response()->json(['data'=>$re->all()]);


    }
}
