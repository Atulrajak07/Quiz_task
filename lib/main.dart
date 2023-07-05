import 'package:earnest_task/core/page.dart';
import 'package:earnest_task/core/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/database/database_connect.dart';
import 'firebase_options.dart';

late Size mq;

void main() async{
  var db = Database();
  db.fetchData();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCQ Quiz',
      theme: ThemeData(
      ),
      initialRoute: Routes.splash,
      getPages:allpages,
    );
  }
}

