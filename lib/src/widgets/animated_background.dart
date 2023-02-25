import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'color1',
        ColorTween(
            begin: const Color(0xffD38312), end: Colors.lightBlue.shade900),
        duration: const Duration(seconds: 3),
      )
      ..tween(
        'color2',
        ColorTween(begin: const Color(0xffA83279), end: Colors.blue.shade600),
        duration: const Duration(seconds: 3),
      );

    return MirrorAnimationBuilder(
      tween: tween,
      duration: tween.duration,
      builder: (context, animation, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [animation.get('color1'), animation.get('color2')],
            ),
          ),
        );
      },
    );
  }
}
