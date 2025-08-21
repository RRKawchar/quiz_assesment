import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q${currentIndex + 1}/$totalIndex",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (currentIndex + 1) / totalIndex,
          ),
        ],
      ),
    );
  }
}
