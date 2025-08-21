abstract class QuestionEvent{}

class GetAllQuestionEvent extends QuestionEvent{}


class SelectedAnswer extends QuestionEvent{
  final int selectedIndex;
  SelectedAnswer(this.selectedIndex);
}

class NextQuestionEvent extends QuestionEvent {}