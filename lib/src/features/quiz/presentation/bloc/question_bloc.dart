import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_assesment/src/features/quiz/domain/repositories/question_repository.dart';
import 'package:quiz_assesment/src/features/quiz/domain/usecases/get_question_usecase.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_event.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent,QuestionState>{
  final GetAllQuestionUseCase useCase;
  QuestionBloc(this.useCase):super(QuestionInitial()){
    on<GetAllQuestionEvent>(_onGetAllQuestion);
    on<SelectedAnswer>(_onSelectedAnswer);
    on<NextQuestionEvent>(_onNextQuestion);
  }

 void _onGetAllQuestion(GetAllQuestionEvent event,Emitter<QuestionState> emit)async{
   emit(QuestionLoadingState());
    try{
     final questions= await useCase.call();
       emit(GetAllQuestionState(questions: questions));
    }catch(e){
       emit(QuestionErrorState(e.toString()));
    }
 }

 void _onSelectedAnswer(SelectedAnswer event,Emitter<QuestionState> emit){
    if(state is GetAllQuestionState){
      final currentState= state as GetAllQuestionState;

      final currentQuestion=currentState.questions[currentState.currentIndex];
      int updateScore=currentState.score;
      if(event.selectedIndex==currentQuestion.answer_index){
        updateScore++;
      }

      emit(currentState.copyWith(
        selectedIndex: event.selectedIndex,
        score: updateScore,
      ));
    }
 }

  void _onNextQuestion(
      NextQuestionEvent event, Emitter<QuestionState> emit) {
    if (state is GetAllQuestionState) {
      final currentState = state as GetAllQuestionState;
      final nextIndex = currentState.currentIndex + 1;

      if (nextIndex < currentState.questions.length) {
        emit(currentState.copyWith(
          currentIndex: nextIndex,
          selectedIndex: null,
        ));
      } else {
        emit(QuizCompleteState(
            score: currentState.score,
            totalQuestion: currentState.questions.length
        ));
      }
    }
  }

}