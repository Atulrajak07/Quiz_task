import 'package:earnest_task/core/Gobal/font.dart';
import 'package:earnest_task/core/Gobal/validation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../../core/Gobal/custombutton.dart';
import '../../../core/Gobal/customscroll.dart';
import '../../../core/routes.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});


  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       leading: IconButton(
       onPressed: () => Get.back(),
       icon: const Icon(Icons.arrow_back),
       color: Colors.black54,
     ),
     ),

     body: GestureDetector(
       onTap: ()=> Get.focusScope!.unfocus(),
       child:  ScrollConfiguration(
         behavior:CustomScroll() ,
       child:  SingleChildScrollView(
               child:Container(
                 margin: const EdgeInsets.all(10),
                   child: Column(
                     children: [
                       Column(
                         children:  [
                           Text("LOG IN YOUR ACCOUNT",
                             style: TextStyle(
                               fontFamily: Customfont.din,
                               fontSize: 25,
                             ),
                           ),
                         ],
                       ),

                       SizedBox(
                         height: Get.height * 0.1,
                       ),
                       
                       Form(
                         key: Validation.loginKey,
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                         child: Column(
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
                               height: 10,
                             ),
                         Obx(() => TextFormField(
                           style: const TextStyle(color: Colors.black54),
                           obscureText: controller.isPass.value,
                           controller: controller.pass,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.zero,
                               filled: true,
                               hintStyle:
                               const TextStyle(color: Colors.black54),
                               hintText: 'Enter Password',
                               suffixIcon: IconButton(
                                   onPressed: () => controller.showPass(),
                                   icon: controller.isPass.value
                                       ? const Icon(Icons.visibility_off)
                                       : const Icon(Icons.visibility)),
                               prefixIcon: const Icon(Icons.lock),
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10))),
                           validator: MultiValidator(
                             [
                               RequiredValidator(
                                   errorText: 'Required Password'),
                               PatternValidator(
                                   RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                                       .pattern,
                                   errorText:
                                   ("Password doesn't match the format : Abc@123"))
                             ],
                           ),
                         )),
                           ],
                              ),
                       ),

                       const SizedBox(
                         height: 10,
                       ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           InkWell(
                             // onTap: () => Get.toNamed(Routes.forgot),
                             child: Text(
                               "Forgot Password?",
                               style: TextStyle(
                                 fontFamily: Customfont.din,
                                   fontWeight: FontWeight.w600,
                                   letterSpacing: 1,
                                   fontSize: Get.height*0.02
                               ),
                             ),
                           ),
                         ],
                       ),

             const SizedBox(
                      height: 10,
             ),

                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                         child: CustomButton(title: 'Login',onPress: (){
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

                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                         child: CustomButton(title: 'Register Here',onPress: (){
                           Get.toNamed(Routes.sign);
                         },
                         ),
                       ),




                     ],
                   ),
               ),
           ),
       ),
     ),

   );
  }
  
}