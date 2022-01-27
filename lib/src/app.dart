import 'package:flutter/material.dart';
import './screens/password_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generatorr',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.grey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // background (button) color
            onPrimary: Colors.white, // foreground (text) color
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
