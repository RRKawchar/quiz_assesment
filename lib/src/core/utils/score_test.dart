class ScoreUtils {
  static int calculateScore(List<int> answers, List<int> correctAnswers) {
    int score = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == correctAnswers[i]) {
        score++;
      }
    }
    return score;
  }
}
