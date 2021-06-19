class Survey {
  final String question;
  final List<String> answers;
  int selectedIndex = -1;

  Survey({required this.question, required this.answers});
}
