import 'package:earnest_task/core/Gobal/gobalcolor.dart';
import 'package:flutter/material.dart';

class Dialogs{

  static void showSnackbar(context , String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),
      backgroundColor: incorrect.withOpacity(.8),
      behavior: SnackBarBehavior.floating,));
  }

  static void showProgressBar(context){
    showDialog(context: context,
        builder: (_)=> const Center(child: CircularProgressIndicator()));
  }


}