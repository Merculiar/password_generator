import 'package:flutter/material.dart';

class OptionWidget extends StatefulWidget {
  OptionWidget(this.optionText);

  final optionText;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    bool _isChecked = true;

    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text(widget.optionText),
      ],
    );
  }
}
