import 'package:flutter/material.dart';
import 'package:quiz_assesment/src/core/routes/routes_name.dart';

import '../../../../core/services/responsive.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("RobizCode Quiz",
          style: TextStyle(fontSize: responsive.scaleText(20)),),
      ),

      body: Padding(
        padding: EdgeInsets.all(responsive.scaleWidth(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, RoutesName.quizPage),
              child: Text('Start Quiz',
                style: TextStyle(fontSize: responsive.scaleText(16)),),
            ),
            SizedBox(height: responsive.scaleHeight(12)),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, RoutesName.leaderBoard),
              child: Text('Leaderboard',
                style: TextStyle(fontSize: responsive.scaleText(16)),),
            ),
          ],
        ),
      ),
    );
  }
}
