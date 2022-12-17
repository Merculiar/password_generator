import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';

import '../blocs/logic.dart';

class NumberPickerWidget extends StatefulWidget {
  NumberPickerWidget();

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LogicBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Choose password length: '),
        NumberPicker(
          axis: Axis.horizontal,
          itemWidth: 50,
          minValue: 1,
          maxValue: 15,
          value: bloc.number,
          onChanged: (value) => setState(() => bloc.number = value),
        ),
      ],
    );
  }
}
