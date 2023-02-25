import 'dart:math';

import 'package:flutter/material.dart';
import 'package:password_generator/src/common/routing_names.dart';

import '../widgets/animated_background.dart';
import '../widgets/animated_wave.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Password generator')),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedBackground()),
          onBottom(const AnimatedWave(
            height: 180,
            speed: 1.0,
          )),
          onBottom(const AnimatedWave(
            height: 120,
            speed: 0.9,
            offset: pi,
          )),
          onBottom(const AnimatedWave(
            height: 220,
            speed: 1.2,
            offset: pi / 2,
          )),
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 15),
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                    width: 100,
                    height: 100,
                    'assets/images/launch_icon_android.png'),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, passwordScreen);
                  },
                  child: const Text('Generate password'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, savedPasswordsScreen);
                  },
                  child: const Text('Saved passwords'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
