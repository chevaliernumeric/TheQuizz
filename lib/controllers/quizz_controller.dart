import '../models/question_model.dart';

class QuizzController {
  final List<QuestionModel> _questions = [
    QuestionModel(
        question: "La durée d'un jour a toujours été de 24 heures",
        answer: false),
    QuestionModel(question: "Les éléphants ont peur des souris", answer: false),
    QuestionModel(
        question: "Certaines pierres flottent sur l'eau", answer: true),
    QuestionModel(
        question:
            "Les autruches mettent la tête dans le sable quand elles ont peur",
        answer: false),
    QuestionModel(
        question:
            "Aux États-Unis, il n'y a pas d'étage nº 13 dans les immeubles",
        answer: true),
    QuestionModel(
        question: "L'homme a plus de poils que la femme", answer: false),
    QuestionModel(
        question: "Le taureau est excité par la couleur rouge", answer: false),
    QuestionModel(
        question: "Le poisson rouge a une mémoire de quelques secondes",
        answer: false),
    QuestionModel(
        question:
            "Les connexions Wi-Fi peuvent être perturbées par les fours à micro-ondes",
        answer: true),
    QuestionModel(
        question: "Il fait plus froid au pôle Sud qu'au pôle Nord",
        answer: true),
    QuestionModel(
        question:
            "La Grande Muraille de Chine est la seule construction humaine visible depuis la Lune",
        answer: false),
    QuestionModel(
        question: "Les chutes du Niagara peuvent geler", answer: true),
    QuestionModel(
        question: "Il est impossible d'éternuer les yeux ouverts", answer: true)
  ];

  bool getAnswer(int indexQuestion) {
    return _questions[indexQuestion].answer;
  }

  String getQuestion(int indexQuestion) {
    return _questions[indexQuestion].question;
  }

  int getLength() {
    return _questions.length;
  }

  void shuffleQuestion() {
    _questions.shuffle();
  }
}
