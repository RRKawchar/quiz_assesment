import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_assesment/src/core/di/init_dependency.dart';
import 'package:quiz_assesment/src/core/routes/app_routes.dart';
import 'package:quiz_assesment/src/core/theme/app_theme.dart';
import 'package:quiz_assesment/src/features/home/presentation/pages/home_page.dart';
import 'package:quiz_assesment/src/features/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();

  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>getIt<QuestionBloc>()),
      BlocProvider(create: (_)=>getIt<LeaderboardBloc>()),
    ],
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRoutes.generatedRoute,
      home: HomePage()
    );
  }
}

