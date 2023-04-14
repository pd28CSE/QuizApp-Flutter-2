import 'package:flutter/material.dart';
import 'package:quizeapp/data/questions.dart';

import 'package:quizeapp/screens/home_screen.dart';
import 'package:quizeapp/screens/questions_screen.dart';
import 'package:quizeapp/screens/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];
  String activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void reStartQuiz() {
    selectedAnswer.clear();
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void addAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return activeScreen == 'home-screen'
        ? HomeScreen(switchScreen)
        : activeScreen == 'questions-screen'
            ? QuestionsScreen(onAddAnswer: addAnswer)
            : ResultScreen(
                chosenAnswers: selectedAnswer,
                onRestartQuiz: reStartQuiz,
              );
  }
}
