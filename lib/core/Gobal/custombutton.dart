import 'package:earnest_task/core/Gobal/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'gobalcolor.dart';

class CustomButton extends GetView {
  final String title;
  final VoidCallback onPress;
  const CustomButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: Get.width,
      child: MaterialButton(
        onPressed: onPress,
        color: neutral,
        shape: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(
                color: background,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                fontSize: Get.height * 0.03,
                fontFamily: Customfont.din),
          ),
        ),
      ),
    );
  }
}