// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_assesment/src/core/utils/score_test.dart';

void main() {
  test('score calculation works correctly', () {
    final answers = [1, 2, 3];
    final correctAnswers = [1, 2, 0];

    final score = ScoreUtils.calculateScore(answers, correctAnswers);

    expect(score, 2);
  });

  test('all answers correct', () {
    final answers = [1, 2, 3];
    final correctAnswers = [1, 2, 3];

    final score = ScoreUtils.calculateScore(answers, correctAnswers);

    expect(score, 3);
  });

  test('no answers correct', () {
    final answers = [1, 2, 3];
    final correctAnswers = [0, 0, 0];

    final score = ScoreUtils.calculateScore(answers, correctAnswers);

    expect(score, 0);
  });
}
