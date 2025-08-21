
import 'package:quiz_assesment/src/features/quiz/domain/entities/question_entity.dart';

abstract class QuestionState{}

class QuestionInitial extends QuestionState{}

class QuestionLoadingState extends QuestionState{}

class GetAllQuestionState extends QuestionState{
   final List<QuestionEntity> questions;
   final int currentIndex;
   final int? selectedIndex;
   final int score;
   GetAllQuestionState({
    required this.questions,
     this.currentIndex=0,
     this.selectedIndex,
     this.score=0,
   });


   GetAllQuestionState copyWith({
     List<QuestionEntity>? questions,
     int? currentIndex,
     int? selectedIndex,
     int? score,
     int? remainingSeconds,
   }) {
     return GetAllQuestionState(
       questions: questions ?? this.questions,
       currentIndex: currentIndex ??this.currentIndex,
       selectedIndex: selectedIndex,
       score: score ??this.score,
     );
   }

}

class QuizCompleteState extends QuestionState{
  final int score;
  final int totalQuestion;
  QuizCompleteState({required this.score,required this.totalQuestion});
}

class QuestionErrorState extends QuestionState{
  final String message;
  QuestionErrorState(this.message);
}

