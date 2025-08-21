import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LatexTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? align;
  const LatexTextWidget(this.text, {super.key, this.style, this.align});

  @override
  Widget build(BuildContext context) {
   return TeXWidget(
     math: text,
   );


  }


}
