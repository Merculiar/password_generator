import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/logic.dart';

class OptionWidget extends StatefulWidget {
  OptionWidget(this.optionText, this.optionType);

  String optionText;
  String optionType;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LogicBloc>(context);
    return SizedBox(
      width: 180,
      child: Row(
        children: [
          Checkbox(
            value: bloc.getOption(widget.optionType),
            onChanged: (bool? value) {
              setState(() {
                bloc.setOption(widget.optionType, value!);
              });
            },
          ),
          Text(widget.optionText),
        ],
      ),
    );
  }
}
