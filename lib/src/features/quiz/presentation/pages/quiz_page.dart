import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_assesment/src/core/routes/routes_name.dart';
import 'package:quiz_assesment/src/core/widgets/latex_text_widget.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_bloc.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_state.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/widgets/option_list_widget.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/widgets/progressbar_widget.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/widgets/question_next_btn.dart';
import '../../../../core/services/responsive.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../bloc/question_event.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Timer? _timer;
  int _remainingTime = 15;
  @override
  void initState() {
    super.initState();
    context.read<QuestionBloc>().add(GetAllQuestionEvent());
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _remainingTime = 15;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 1) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        _remainingTime = 15;
        context.read<QuestionBloc>().add(NextQuestionEvent());
        _startTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Page",style: TextStyle(fontSize: responsive.scaleText(20)),),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "$_remainingTime s",
            style: TextStyle(
                fontSize: responsive.scaleText(20), fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
      ],
      ),
      body: BlocConsumer<QuestionBloc, QuestionState>(
        listener: (context, state) {
          if (state is QuestionErrorState) {
            showSnackBar(context, state.message);
          }

          if(state is QuizCompleteState){
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.resultPage, (_)=>false,
                arguments:{
              'score':state.score,
              'totalQuestion':state.totalQuestion
            } );
          }
        },
        builder: (context, state) {
          if (state is QuestionLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllQuestionState) {
            return Column(
              children: [
                /// Progress indicator
                ProgressbarWidget(
                    currentIndex: state.currentIndex,
                    totalIndex: state.questions.length
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child,animation){
                        final offsetAnim=Tween<Offset>(
                          begin: Offset(0, 1),
                          end: Offset.zero
                        ).animate(animation);
                        return SlideTransition(
                            position: offsetAnim,
                            child: FadeTransition(
                                opacity: animation,
                                 child: child,
                            ),
                        );
                      },
                      child: Column(
                        key: ValueKey(state.currentIndex),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),

                          // Question text
                          LatexTextWidget(
                            "${state.currentIndex + 1}. ${state.questions[state.currentIndex].question}"
                          ),

                          const SizedBox(height: 20),

                          /// Options
                          OptionListWidget(
                            options: state.questions[state.currentIndex].options,
                            selectedIndex: state.selectedIndex,
                            onOptionSelected: (i) {
                              context.read<QuestionBloc>().add(SelectedAnswer(i));
                            },
                          ),
                        ],
                      ),
                    )
                  ),
                ),
                QuestionNextBtn(
                    onPressed: (){
                      _timer?.cancel();
                      _remainingTime = 15;
                      context.read<QuestionBloc>().add(NextQuestionEvent());
                      _startTimer();
                    }
                ),
                SizedBox(height: 20)
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}


