class Question {
  final String text;
  final List<Answer> answers;
  Question({required this.text, required this.answers});
}

class Answer {
  final String text;
  final bool isCorrect;
  Answer({required this.text, required this.isCorrect});
}

List<Question> questions = [
  Question(
    text: 'Who is the owner of Flutter ?',
    answers: [
      Answer(text: 'Nokia', isCorrect: false),
      Answer(text: 'Samsung', isCorrect: false),
      Answer(text: 'Google', isCorrect: true),
      Answer(text: 'Appel', isCorrect: false),
    ],
  ),
  Question(
    text: 'Who is the owner of Iphone ?',
    answers: [
      Answer(text: 'Microsoft', isCorrect: false),
      Answer(text: 'Oppo', isCorrect: false),
      Answer(text: 'Google', isCorrect: false),
      Answer(text: 'Appel', isCorrect: true),
    ],
  ),
  Question(
    text: 'Youtube is ________ platform ?',
    answers: [
      Answer(text: 'Music sharing', isCorrect: false),
      Answer(text: 'Video sharing', isCorrect: false),
      Answer(text: 'Live streaming', isCorrect: false),
      Answer(text: 'All of the above ', isCorrect: true),
    ],
  ),
  Question(
    text: 'Flutter is fun ?',
    answers: [
      Answer(text: 'True', isCorrect: true),
      Answer(text: 'False', isCorrect: false),
    ],
  ),
];
