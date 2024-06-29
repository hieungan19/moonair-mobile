import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final int value;
  final int groupValue;
  final Function onChanged;

  const CustomRadioButton({
    super.key,
    required this.label,
    required this.textColor,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      leading: Radio<int>(
        value: value,
        groupValue: groupValue,
        onChanged: (int? newValue) {
          onChanged(newValue);
        },
      ),
    );
  }
}
