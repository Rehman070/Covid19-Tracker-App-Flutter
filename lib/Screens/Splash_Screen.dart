import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid19_tracker_app/Screens/Countries_States.dart';
import 'package:covid19_tracker_app/Screens/World_States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 3000), vsync: this)
    ..repeat();

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 47.0,
    fontWeight: FontWeight.w700,
   
  );

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 3000),
        (() => Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: ((context) => const Home())))));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: ((context, child) {
                return Transform.rotate(
                  angle: controller.value * 3.0 * 0.25 * math.pi,
                  child: child,
                );
              }),
              child: SizedBox(
                height: 270,
                width: 270,
                child: Center(
                  child: Image.asset('Assets/Images/covid19.png'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 240.0,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText('Covid-19\nTracker',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      textAlign: TextAlign.center),
                ],
                isRepeatingAnimation: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
