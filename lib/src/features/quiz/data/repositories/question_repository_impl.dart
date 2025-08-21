import 'package:quiz_assesment/src/features/quiz/data/datasources/question_local_data_source.dart';
import 'package:quiz_assesment/src/features/quiz/domain/entities/question_entity.dart';

import '../../domain/repositories/question_repository.dart';

class QuestionRepositoryImpl extends QuestionRepository{
  final QuestionLocalDataSource questionLocalDataSource;

  QuestionRepositoryImpl(this.questionLocalDataSource);


  @override
  Future<List<QuestionEntity>> getAllQuestion() {
   return questionLocalDataSource.getAllQuestion();
  }

}