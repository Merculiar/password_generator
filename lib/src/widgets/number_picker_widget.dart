import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';

import '../blocs/password_bloc.dart';

class NumberPickerWidget extends StatefulWidget {
  const NumberPickerWidget({super.key});

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PasswordBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Choose password length: '),
        NumberPicker(
          axis: Axis.horizontal,
          itemWidth: 40,
          minValue: 1,
          maxValue: 15,
          value: bloc.number,
          onChanged: (value) => setState(() => bloc.number = value),
        ),
      ],
    );
  }
}
