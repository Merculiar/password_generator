import 'package:flutter/material.dart';
import 'package:password_generator/src/blocs/password_bloc.dart';
import 'package:password_generator/src/services/save_data_service.dart';
import 'package:password_generator/src/widgets/number_picker_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/option_widget.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final saveDataService = SaveDataService();
  final textFieldController = TextEditingController();

  late PasswordBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = Provider.of<PasswordBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.clearValues();
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate password'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        color: bloc.isError ? Colors.red : Colors.black),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: const Text('save'),
                onPressed: (bloc.password.isNotEmpty && !bloc.isError)
                    ? () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Enter password hint name'),
                                content: TextField(
                                  onChanged: (value) {},
                                  controller: textFieldController,
                                  decoration: const InputDecoration(
                                      hintText: 'Enter name'),
                                ),
                                actionsAlignment:
                                    MainAxisAlignment.spaceBetween,
                                actions: [
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      textFieldController.clear();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      saveDataService.savePassword(
                                          textFieldController.text,
                                          bloc.password);
                                      bloc.refreshValues();
                                      Navigator.of(context).pop();
                                      textFieldController.clear();
                                    },
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ],
                              );
                            });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
