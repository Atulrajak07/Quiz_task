import 'package:earnest_task/core/Gobal/customsnack.dart';
import 'package:earnest_task/core/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{


  final email = TextEditingController();
 var  pass = TextEditingController();

 RxBool isPass = true.obs;

  showPass() {
    if (isPass.value == true) {
      isPass.value = false;
    } else {
      isPass.value = true;
    }
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  tologin(){
    auth.signInWithEmailAndPassword(email: email.text, password: pass.text).then((value){
    Get.toNamed(Routes.home);
    }).onError((error, stackTrace){
      Dialogs.showSnackbar(Get.context,"Registration Successfull");
    });
  }


}

