
import 'dart:convert';

import 'package:earnest_task/core/model/questionmodel.dart';
import 'package:http/http.dart' as http;

class Database{
  final url = Uri.parse('https://mcq-quiz-3ad3b-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async{
     http.post(url, body:  json.encode({
       'title': question.title,
       'option': question.option,
     }));
  }


  Future<void> fetchData() async{
    http.get(url).then((response){
      var data = json.decode(response.body);
      print(data);
    });
  }


}