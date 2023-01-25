import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/logic.dart';
import './screens/password_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogicBloc(),
      child: MaterialApp(
        title: 'Password Generator',
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.grey,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red, // foreground (text) color
            ),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
