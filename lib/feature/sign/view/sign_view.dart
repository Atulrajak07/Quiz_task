import 'package:earnest_task/core/Gobal/custombutton.dart';
import 'package:earnest_task/core/Gobal/customscroll.dart';
import 'package:earnest_task/core/Gobal/font.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/routes.dart';
import '../controller/sign_controller.dart';

class SignView extends GetView<SignController>{
  const SignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.login),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black54,
        ),
      ),

      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child:  ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [

                     Text("Registration Form",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: Get.height * 0.04,
                         fontFamily: Customfont.din,
                       ),
                     ),
                     Text(
                       "Let's Get Started the Quiz",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           color: Colors.grey,
                           fontSize:Get.height*0.02,
                           fontFamily: Customfont.din),
                     ),

                     const SizedBox(
                       height: 15,
                     ),

                     SizedBox(

                       child: Form(
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             TextFormField(
                               controller: controller.email,
                               keyboardType: TextInputType.emailAddress,
                               style: const TextStyle(color: Colors.black54),
                               decoration: InputDecoration(
                                   contentPadding: EdgeInsets.zero,
                                   counterText: '',
                                   filled: true,
                                   hintStyle:
                                   const TextStyle(color: Colors.black54),
                                   hintText: 'Enter Email ' ,
                                   prefixIcon: const Icon(Icons.email_outlined),
                                   border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10))),

                               validator: MultiValidator([
                                 RequiredValidator(errorText: 'Email required'),
                                 PatternValidator(
                                     RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                         .pattern,
                                     errorText: 'Invalid email')
                               ]),
                             ),

                             const SizedBox(
                               height: 15,
                             ),

                             Obx(() => TextFormField(
                               controller: controller.password,
                               style: const TextStyle(color: Colors.black54),
                               obscureText: controller.isPass.value,
                               decoration: InputDecoration(
                                   contentPadding: EdgeInsets.zero,
                                   filled: true,
                                   hintStyle: const TextStyle(
                                       color: Colors.black54),
                                   hintText: 'Enter Password',
                                   suffixIcon: IconButton(
                                       onPressed: () =>
                                           controller.showPass(),
                                       icon: controller.isPass.value
                                           ? const Icon(Icons.visibility_off)
                                           : const Icon(Icons.visibility)),
                                   prefixIcon: const Icon(Icons.lock),
                                   border: OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.circular(10))),
                               validator: MultiValidator([
                                 MinLengthValidator(6,
                                     errorText:
                                     'Password must be at least 6 digits long'),
                                 RequiredValidator(
                                     errorText: 'Password required'),
                                 PatternValidator(
                                     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                                         .pattern,
                                     errorText:
                                     "Password doesn't match the format : Abc@123")
                               ]),
                             )),


                             const SizedBox(
                               height: 15,
                             ),


                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                               child: CustomButton(title: 'Submit',onPress: (){
                                 controller.tologin();
                               },
                               ),
                             ),

                             const SizedBox(
                               height: 10,
                             ),

                             Container(
                               margin: const EdgeInsets.symmetric(horizontal: 10),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   const Expanded(
                                       child: Divider(
                                         color: Colors.black54,
                                       )),
                                   Text(
                                     " OR  ",
                                     style: TextStyle(
                                         color: Colors.black54,
                                         fontWeight: FontWeight.w500,
                                         fontFamily: Customfont.din,
                                         fontSize: Get.height*0.02
                                     ),
                                   ),
                                   const Expanded(
                                       child: Divider(
                                         color: Colors.black54,
                                       )),
                                 ],
                               ),
                             ),

                             const SizedBox(
                               height: 10,
                             ),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children:   [
                                 InkWell(
                                   onTap: () => controller.sendotp(),
                                   child:   CircleAvatar(
                                     radius:30 ,
                                     backgroundColor: Colors.white30,
                                     child: Image.asset("images/phone.png", width: 45,),
                                   ),
                                 ),
                                 const SizedBox(
                                   width: 15,
                                 ),
                                 InkWell(
                                   onTap: () => controller.GoogleSign(),

                                   child:  CircleAvatar(
                                     radius:30 ,
                                     backgroundColor: Colors.white30,
                                     child: Image.asset("images/google.png", width: 40,),
                                   ),
                                 ),
                               ],
                             ),


                           ],

                         ),
                         
                       ),
                     )
                   ],
                 ),
            ),

          ),

        ),
      ),
    );
  }

}