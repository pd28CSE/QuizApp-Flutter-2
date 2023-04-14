import 'package:flutter/material.dart';

import 'package:quizeapp/answer_button.dart';
import 'package:quizeapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            questions[currentQuestion].text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...questions[currentQuestion].answers.map((questionAnswer) {
            return AnswerButton(
                answer: questionAnswer,
                onTab: () {
                  currentQuestion = (currentQuestion + 1) % questions.length;
                  setState(() {});
                });
          }),
        ],
      ),
    );
  }
}
