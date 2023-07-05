import 'package:earnest_task/core/Gobal/gobalcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultDialog extends GetView {
  const ResultDialog({
    Key? key,
    required this.result,
    required this.questionlength,
    required this.Pressed,
  }) : super(key: key);

  final int result;
  final int questionlength;
  final VoidCallback Pressed;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
           children:  [
             const Text('Result',
             style: TextStyle(
               fontSize: 24.0,
               fontWeight: FontWeight.bold
             ),),
             const SizedBox(height: 10.0),
              CircleAvatar(
                 radius: 60,
                 backgroundColor: result == questionlength /2 ? Colors.yellow : result < questionlength /2 ? incorrect : correct ,
                 child:  Text('$result/$questionlength',
               style:  const TextStyle(
                 fontSize: 30.0),
               ),
             ),
             const SizedBox(height: 10.0,),
             Text(result == questionlength /2 ? 'Almost There'  : result < questionlength /2 ? 'Try Again?' : 'Great !',
             style: const TextStyle(
               fontSize: 20.0,
             ),
             ),
             const SizedBox(height: 15,),
             GestureDetector(
               onTap: Pressed ,
                child: const Text('Start Over',
                 style:TextStyle(
                   fontSize: 22.0,
                   letterSpacing: 1.0,
                 ),),
             ),

           ],
        ),
      ),
    );
  }
}

