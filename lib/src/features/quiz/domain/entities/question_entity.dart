import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable{

  String question;
  List<String> options;
  int answer_index;


   QuestionEntity({required this.question,required this.options,required this.answer_index});

  @override
  List<Object?> get props =>[
    question,
    options,
    answer_index
  ];


}