import 'package:flutter/foundation.dart';

class LoginValidator extends ChangeNotifier{



   String email = "";
   String password = "";
  bool is_valid = false;



  bool get ValidEmail=>is_valid;

   setEmail(String emails){

    email=emails;

    bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(email.isNotEmpty){
      if(emailValid){
        is_valid=true;
        notifyListeners();
      }else{
        is_valid=false;
        notifyListeners();
      }



      notifyListeners();
    }else{

      is_valid=false;
      notifyListeners();
    }

  }
  setPassword(String passwords){

     password=passwords;
     if(password.isNotEmpty){


       is_valid=true;
       notifyListeners();


   }else{

     is_valid=false;
     notifyListeners();

     }
  }






}