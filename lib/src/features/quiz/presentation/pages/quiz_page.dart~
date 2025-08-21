import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_assesment/src/core/routes/routes_name.dart';
import 'package:quiz_assesment/src/core/widgets/latex_text_widget.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_bloc.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_state.dart';
import '../bloc/question_event.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    context.read<QuestionBloc>().add(GetAllQuestionEvent());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Page")),
      body: BlocConsumer<QuestionBloc, QuestionState>(
        listener: (context, state) {
          if (state is QuestionErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }

          if(state is QuizCompleteState){
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.resultPage, (_)=>false,arguments:{
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Q${state.currentIndex + 1}/${state.questions.length}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: (state.currentIndex + 1) / state.questions.length,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        // Question text
                        LatexTextWidget(
                          "${state.currentIndex + 1}. ${state.questions[state.currentIndex].question}",
                        ),

                        const SizedBox(height: 20),

                        // Options
                        ...List.generate(
                          state.questions[state.currentIndex].options.length,
                              (i) {
                            final question = state.questions[state.currentIndex];
                            String option = ["A", "B", "C", "D"][i]; // shortcut

                            final isSelected = state.selectedIndex == i;

                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<QuestionBloc>()
                                      .add(SelectedAnswer(i));
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: isSelected
                                          ? Colors.blueAccent
                                          : Colors.grey[200],
                                      radius: 12,
                                      child: Text(
                                        option,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: LatexTextWidget(question.options[i]),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {

                      context.read<QuestionBloc>().add(NextQuestionEvent());
                    },
                    child: Text("Next",style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
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


