import 'package:earnest_task/core/Gobal/custombutton.dart';
import 'package:earnest_task/core/Gobal/gobalcolor.dart';
import 'package:earnest_task/core/Gobal/option_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/Gobal/drawer.dart';
import '../../../core/model/questionwidget.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController>{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz'),
        elevation: 0,
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions:    [
             Obx(()=>
                Padding(padding:  const EdgeInsets.all(18.0),
                 child: Text('Score : ${controller.score.value}',
                 style: const TextStyle(
                    fontSize: 18.0
                 ),),
                ),
             ),

          IconButton(onPressed: (){
            controller.logout();
          },
              icon:const Icon(Icons.logout_outlined))
        ],
      ),
       // drawer: const CustomDrawer(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Obx(()=>
           Column(
            children: [
              Obx(() => OuestionWidget(
                  indexAction: controller.index.value,
                  question: controller.questions[controller.index.value].title,
                   totalQuestion: controller.questions.length,
                ),
              ),
              const Divider(color: neutral,thickness: 1),

              const SizedBox(height: 25.0,),
              for( int i = 0; i < controller.questions[controller.index.value].option.length; i++)

                 Obx(()=>

                    GestureDetector(
                      onTap: () => controller.change(controller.questions[controller.index.value].option.values.toList()[i]),
                      child: OptionCard(
                       option:controller.questions[controller.index.value].option.keys.toList()[i] ,
                       color: controller.isPressed.value ?
                                    controller.questions[controller.index.value].option.values.toList()[i] ==
                           true ? correct : incorrect : neutral ,
                   ),
                    ),
                 ),
            ],
          ),
        ),
      ),
      floatingActionButton:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomButton(title: 'Next',onPress: (){
              controller.nextQuestion();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
