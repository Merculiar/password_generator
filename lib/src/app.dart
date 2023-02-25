import 'package:flutter/material.dart';
import 'package:password_generator/src/common/routing_names.dart';
import 'package:password_generator/src/screens/saved_passwords_screen.dart';
import 'package:password_generator/src/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'blocs/password_bloc.dart';
import './screens/password_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordBloc(),
      child: MaterialApp(
        title: 'Password Generator',
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.grey,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 40),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red, // foreground (text) color
            ),
          ),
        ),
        initialRoute: welcomeScreen,
        routes: {
          welcomeScreen: (context) => const WelcomeScreen(),
          passwordScreen: (context) => const PasswordScreen(),
          savedPasswordsScreen: (context) => SavedPasswordsScreen(),
        },
      ),
    );
  }
}
