import 'package:flutter/material.dart';

import '../../../../core/services/responsive.dart';

class ProgressbarWidget extends StatelessWidget {
  final int currentIndex;
  final int totalIndex;
  const ProgressbarWidget({
    super.key,
    required this.currentIndex,
    required this.totalIndex,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q${currentIndex + 1}/$totalIndex",
            style: TextStyle(
                fontSize: responsive.scaleText(20), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (currentIndex + 1) / totalIndex,
            minHeight: responsive.scaleHeight(8),
            borderRadius: BorderRadius.circular(responsive.scaleText(40)),
          ),
        ],
      ),
    );
  }
}
