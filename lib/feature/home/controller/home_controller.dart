import 'package:earnest_task/core/Firebase%20Api/api.dart';
import 'package:earnest_task/core/Gobal/result_dialog.dart';
import 'package:earnest_task/core/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/Gobal/customsnack.dart';
import '../../../core/model/questionmodel.dart';


class HomeController extends GetxController {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt index = 0.obs;
  RxInt score = 0.obs;
  RxBool isPressed = false.obs;
  RxBool isSelect = false.obs;


  nextQuestion() {
    if (index.value == questions.length - 1) {
      Get.dialog(
        ResultDialog(result: score.value,
          questionlength: questions.length,
          Pressed: startagian,
        ),
      );
    } else {
      if (isPressed.value) {
        index.value++;
        isPressed.value = false;
        isSelect.value = false;
      } else {
        Dialogs.showSnackbar(Get.overlayContext, "Please select the option");
      }
    }
  }

  change(bool value) {
    if (isSelect.value) {
      return;
    } else {
      if (value = true) {
        score.value++;
      }
      isPressed.value = true;
      isSelect.value = true;
    }
  }

  startagian() {
    index.value++;
    score.value++;
    isPressed.value = false;
    isSelect.value = false;

    Get.back();
  }


  logout() async {

      APi.auth.signOut().then((value) {
        Get.toNamed(Routes.login);
      });


      Dialogs.showProgressBar(Get.context);
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Get.toNamed(Routes.login);
  }


  RxList<Question> questions = [

    Question(
      id: '11',
      title: 'What is the Total of 122 + 2 ?',
      option: {'124': true, '125': false, '144': false, '122': false},
    ),

    Question(
      id: '12',
      title: 'What is the Total of 123 + 2 ?',
      option: {'124': false, '125': true, '144': false, '122': false},
    ),

    Question(
      id: '13',
      title: 'What is the Total of 124 + 2 ?',
      option: {'124': false, '125': false, '144': false, '122': true},
    ),

    Question(
      id: '14',
      title: 'What is the Total of 125 + 2 ?',
      option: {'124': false, '125': false, '144': true, '122': false},
    ),

    Question(
      id: '15',
      title: 'What is the Total of 126 + 2 ?',
      option: {'124': true, '125': false, '144': false, '122': false},
    ),
  ].obs;

}

