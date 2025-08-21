import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quiz_assesment/src/features/quiz/data/models/question_model.dart';

abstract class QuestionLocalDataSource{
  Future<List<QuestionModel>> getAllQuestion();
}



class QuestionLocalDataSourceImpl extends QuestionLocalDataSource{
  @override
  Future<List<QuestionModel>> getAllQuestion() async{
    final response = await rootBundle.loadString("assets/questions.json");
    final List<dynamic> data=json.decode(response);
    return data.map((item)=>QuestionModel.fromJson(item)).toList();
  }

}