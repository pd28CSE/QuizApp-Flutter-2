import 'package:flutter/material.dart';

import 'package:quizeapp/data/questions.dart';
import 'package:quizeapp/widgets/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final VoidCallback onRestartQuiz;
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestartQuiz,
  });

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summary = getSummary();
    final int totalCorrectAnswers = summary.where((item) {
      return item['correct_answer'] == item['user_answer'];
    }).length;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'You answer $totalCorrectAnswers out of ${questions.length} correctly!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionSummary(summaryData: summary),
          TextButton.icon(
            onPressed: onRestartQuiz,
            icon: const Icon(Icons.restore),
            label: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
