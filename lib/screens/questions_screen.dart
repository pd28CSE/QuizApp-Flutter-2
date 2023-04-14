import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

import 'package:quizeapp/widgets/answer_button.dart';
import 'package:quizeapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final Function onAddAnswer;
  const QuestionsScreen({super.key, required this.onAddAnswer});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestion = 0;

  void onSelectAnswer(String answer) {
    widget.onAddAnswer(answer);
    currentQuestion = (currentQuestion + 1) % questions.length;
  }

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
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...questions[currentQuestion]
              .getShuffeledAnswer()
              .map((questionAnswer) {
            return AnswerButton(
                answer: questionAnswer,
                onTab: () {
                  widget.onAddAnswer(questionAnswer);
                  setState(() {
                    currentQuestion = (currentQuestion + 1) % questions.length;
                  });
                });
          }),
        ],
      ),
    );
  }
}
