import 'dart:async';
import 'dart:developer';
import 'package:earnest_task/core/Firebase%20Api/api.dart';
import 'package:earnest_task/core/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds:6), (){
      Get.offAllNamed(Routes.login);
      if(APi.auth.currentUser!= null){
        log('\nUser: ${APi.auth.currentUser}');
        Get.toNamed(Routes.home);
      }else{
        Get.toNamed(Routes.login);
      }
    });
  }

}