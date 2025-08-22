import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LatexTextWidget extends StatelessWidget {
  final String text;

  const LatexTextWidget(this.text, {super.key,});

  @override
  Widget build(BuildContext context) {
   return TeXWidget(
     math: text,
   );


  }


}
