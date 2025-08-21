import 'package:quiz_assesment/src/features/quiz/domain/entities/question_entity.dart';

abstract class QuestionRepository{
  Future<List<QuestionEntity>> getAllQuestion();
}