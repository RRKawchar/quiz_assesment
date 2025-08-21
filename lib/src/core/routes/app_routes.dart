import 'package:flutter/material.dart';
import 'package:quiz_assesment/src/core/routes/routes_name.dart';
import 'package:quiz_assesment/src/features/home/presentation/pages/home_page.dart';
import 'package:quiz_assesment/src/features/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/pages/quiz_page.dart';
import 'package:quiz_assesment/src/features/result/presentation/pages/result_page.dart';

class AppRoutes{
  static Route<dynamic> generatedRoute(RouteSettings setting){
    switch(setting.name){
      case RoutesName.homePage:
        return MaterialPageRoute(builder: (_)=>const HomePage());
      case RoutesName.quizPage:
        return MaterialPageRoute(builder: (_)=>const QuizPage());
      case RoutesName.resultPage:
        final args=setting.arguments as Map<String,dynamic>;
        return MaterialPageRoute(builder: (_)=> ResultPage(
          score: args['score']??0,
          totalQuestion: args['totalQuestion']??0,
        ));
      case RoutesName.leaderBoard:
        return MaterialPageRoute(builder: (_)=>const LeaderboardPage());
      default:
        return MaterialPageRoute(builder: (_)=>
        Scaffold(
          body: Center(child: Text("Page not found"),),
        ));
    }
  }



}