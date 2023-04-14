import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? screenChange;

  const HomeScreen(this.screenChange, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          'Flutter',
          style: GoogleFonts.lato(
            fontSize: 24,
            color: const Color.fromARGB(255, 237, 223, 252),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: screenChange,
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            'Start',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 237, 223, 252),
            ),
          ),
        ),
      ],
    );
  }
}
