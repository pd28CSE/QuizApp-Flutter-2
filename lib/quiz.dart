import 'package:flutter/material.dart';

import 'package:quizeapp/screens/home_screen.dart';
import 'package:quizeapp/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'Questions';
    });
  }

  @override
  Widget build(BuildContext context) {
    return activeScreen == 'home-screen'
        ? HomeScreen(switchScreen)
        : const Questions();
  }
}
