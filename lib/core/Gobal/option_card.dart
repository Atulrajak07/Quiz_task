import 'package:earnest_task/core/Gobal/gobalcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionCard extends GetView {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(option,
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 24.0,
           color: color.red != color.green ? neutral : Colors.black ,
        ),
       ),
      ),
    );
  }
}
