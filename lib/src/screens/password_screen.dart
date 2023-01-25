import 'package:flutter/material.dart';
import 'package:password_generator/src/blocs/logic.dart';
import 'package:password_generator/src/widgets/number_picker_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/option_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 70,
              width: 250,
              color: Theme.of(context).backgroundColor,
              child: Center(
                child: SelectableText(
                  bloc.password,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: bloc.isError ? Colors.red : Colors.black
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: NumberPickerWidget(),
          ),
          Column(
            children: const [
              OptionWidget('contains Uppercase', 'isUpper'),
              OptionWidget('contains lowercase', 'isLower'),
              OptionWidget('contains numbers', 'isNumber'),
              OptionWidget('contains symbols', 'isSymbol'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              child: const Text('generate'),
              onPressed: () => bloc.generatePassword(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
