import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final VoidCallback onTab;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTab,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: const BorderSide(width: 200, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
