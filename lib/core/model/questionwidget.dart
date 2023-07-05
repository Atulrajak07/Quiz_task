import 'package:earnest_task/core/Gobal/gobalcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OuestionWidget extends GetView {
  const OuestionWidget({
    Key? key,
    required this.question,
    required this.indexAction,
    required this.totalQuestion,
    
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.centerLeft,
      child: Text('Question ${indexAction}/$totalQuestion: $question',
      style: const TextStyle(
        fontSize:18,
        fontWeight: FontWeight.bold,
        color: neutral,
      ),),
    );
  }
}
