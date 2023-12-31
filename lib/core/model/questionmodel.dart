class Question{

   final String id;

  final String title;

  final Map<String, bool> option;

  Question({
   required this.id,
   required this.title,
   required this.option,
});

  @override
  String toString(){
    return 'Questions(id:$id, title:$title, option:$option, answer)';
  }
}
