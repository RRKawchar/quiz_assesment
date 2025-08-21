import 'package:flutter/material.dart';
import 'package:quiz_assesment/src/core/routes/routes_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RobizCode Quiz"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, RoutesName.quizPage),
              child: const Text('Start Quiz'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, RoutesName.leaderBoard),
              child: const Text('Leaderboard'),
            ),
          ],
        ),
      ),
    );
  }
}
