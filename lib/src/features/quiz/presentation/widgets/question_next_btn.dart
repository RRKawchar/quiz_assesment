import 'package:flutter/material.dart';

class QuestionNextBtn extends StatelessWidget {
  final VoidCallback onPressed;
  const QuestionNextBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text("Next",style: TextStyle(
            color: Colors.white
        ),),
      ),
    );
  }
}
