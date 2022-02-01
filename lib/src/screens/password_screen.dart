import 'package:flutter/material.dart';
import 'package:password_generator/src/blocs/logic.dart';
import 'package:password_generator/src/widgets/number_picker_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/option_widget.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LogicBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password generator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 70,
              width: 250,
              color: Theme.of(context).backgroundColor,
              child: Center(
                child: SelectableText(bloc.password),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: NumberPickerWidget(),
          ),
          Column(
            children: [
              OptionWidget('contains Uppercase', 'isUpper'),
              OptionWidget('contains lowercase', 'isLower'),
              OptionWidget('contains numbers', 'isNumber'),
              OptionWidget('contains symbols', 'isSymbol'),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text('generate'),
              onPressed: () => bloc.generatePassword(),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
