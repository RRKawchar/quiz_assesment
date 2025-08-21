import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_assesment/src/features/quiz/domain/entities/question_entity.dart';
part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel extends QuestionEntity{
  String question;
  List<String> options;
  int answer_index;

  QuestionModel({
    required this.question,
    required this.options,
    required this.answer_index,
  }):super(question:question,options:options,answer_index:answer_index);


  factory QuestionModel.fromJson(Map<String,dynamic> json)=> _$QuestionModelFromJson(json);
  Map<String,dynamic> toJson()=> _$QuestionModelToJson(this);


}

