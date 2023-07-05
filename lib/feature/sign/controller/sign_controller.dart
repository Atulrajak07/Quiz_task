import 'dart:developer';
import 'dart:io';
// import 'package:earnest_task/core/Firebase%20Api/api.dart';
import 'package:earnest_task/core/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignController extends GetxController{
 final email = TextEditingController();
 final password = TextEditingController();
 static var  phone = TextEditingController();

 var verificationId = '';
 FirebaseAuth auth = FirebaseAuth.instance;


  RxBool isPass = true.obs;
  RxBool isConfirmPass = true.obs;
  showPass() {
    if (isPass.value == true) {
      isPass.value = false;
    } else {
      isPass.value = true;
    }
  }

 showConfirmPass() {
   if (isConfirmPass.value == true) {
     isConfirmPass.value = false;
   } else {
     isConfirmPass.value = true;
   }
 }


  tologin() {
    auth.createUserWithEmailAndPassword(
        email: email.text.toString(),
        password: password.text.toString());
  }



 GoogleSign() async {
   signInWithGoogle().then((user) {
     if(user != null ){
       log('\nUser: ${user.user}');
       log('\nAdditionalInfo: ${user.additionalUserInfo}');

       Get.toNamed(Routes.home);
     }
   });


 }

 Future<UserCredential?> signInWithGoogle () async {
   try {
     await InternetAddress.lookup('google.com');
     // Trigger the authentication flow
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

     // Obtain the auth details from the request
     final GoogleSignInAuthentication? googleAuth = await googleUser
         ?.authentication;

     // Create a new credential
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );

     // Once signed in, return the UserCredential
     return await auth.signInWithCredential(credential);
   }
   catch (e) {
     log('\nsignInWithGoogle: $e');
   }
   return null;
 }




 sendotp() async {
   print(phone.text);
   {
     await auth.verifyPhoneNumber(
         phoneNumber: "+91${phone.text}",
         verificationCompleted: (phoneAuthCredential) async {},
         verificationFailed: (FirebaseAuthException exception) {
           print("verificationFailed");
         },
         codeSent: (verificationID, resendingToken) async {
           Get.back();
           verificationId = verificationID;
           Get.toNamed(Routes.sign, arguments: phone);
         },
         codeAutoRetrievalTimeout: (verificationID) async {});
   }
 }

}