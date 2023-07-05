import 'package:flutter/material.dart';

class Validation{
  static final loginKey=GlobalKey<FormState>();


  static isValid(val,msg){
    if(val==null||val.isEmpty){
      return msg;
    }
  }


}