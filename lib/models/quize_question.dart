class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion({required this.text, required this.answers});

  List<String> getShuffeledAnswer() {
    List<String> shuffeledAnswer = List.of(answers);
    shuffeledAnswer.shuffle();

    return shuffeledAnswer;
  }
}
