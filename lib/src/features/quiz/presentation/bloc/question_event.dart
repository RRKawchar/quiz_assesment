abstract class QuestionEvent{}

class GetAllQuestionEvent extends QuestionEvent{}


class SelectedAnswer extends QuestionEvent{
  final int selectedIndex;
  SelectedAnswer(this.selectedIndex);
}

class NextQuestionEvent extends QuestionEvent {}

class StartTimerEvent extends QuestionEvent{
  final int duration;
  StartTimerEvent({this.duration=15});
}

class TickTimerEvent extends QuestionEvent{
  final int remaining;
  TickTimerEvent(this.remaining);
}

class TimeUpEvent extends QuestionEvent{}

