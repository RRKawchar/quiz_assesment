import 'package:flutter/material.dart';

import '../../../../core/widgets/latex_text_widget.dart';

class OptionListWidget extends StatelessWidget {
  final List<String> options;
  final int? selectedIndex;
  final void Function(int) onOptionSelected;
  const OptionListWidget({
    super.key,
    required this.options,
    this.selectedIndex,
    required this.onOptionSelected
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        options.length, (i) {
        String option = ["A", "B", "C", "D"][i];
        print("kdfdkjfkdjfkjdkfj $option");
        final isSelected = selectedIndex == i;

        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => onOptionSelected(i),
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
                  child: LatexTextWidget(options[i]),
                ),
              ],
            ),
          ),
        );
      },
      )
    );
  }
}
