import 'package:quiz_assesment/src/features/quiz/domain/entities/question_entity.dart';
import 'package:quiz_assesment/src/features/quiz/domain/repositories/question_repository.dart';

class GetAllQuestionUseCase{
  final QuestionRepository repository;
  GetAllQuestionUseCase(this.repository);

 Future<List<QuestionEntity>> call(){
   return repository.getAllQuestion();
 }

}