// class name always start with capital letter

import 'package:quiz/question.dart';

class QuizBrain {
  int questionNumber = 0;
  // to encapsulate the questions we will have to private the questionBank with the help of _ (underscore sign)
  List<Question> questionBank = [
    Question(q: 'Doge is future in cryptocurrency', a: true),
    Question(q: 'Can Doge beat bitcoin in next five years', a: false),
    Question(q: 'Emperor kumar beat elon musk in future', a: true),
    Question(q: 'Cryptotalks is network platform for traders', a: true),
    Question(q: 'LibraryOfLinks new LOL', a: true),
    Question(q: 'TheOnlineWriters became a good startup in year 2022', a: true),
    Question(
        q: 'HabitatVirtuoso will be become hottest startup in construction business',
        a: true),
    Question(
        q: 'diaKart become a dia selling senasation in 2022 Diwali', a: true),
    Question(q: 'AJN become siri', a: true),
    Question(q: 'Book vault beat libraries in next five years', a: true),
    Question(q: 'Yogi is best CM in UTTAR PRADESH till date', a: false),
    Question(q: 'AC is better than cooler', a: false),
    Question(q: 'Human body have Two hundred six bones', a: true),
    Question(q: 'Money change human Attitude', a: true),
    Question(q: 'Truth always come', a: true),
    Question(q: 'Rich man is always a gentle man', a: false),
    Question(q: 'Sun rises in east', a: false),
    Question(q: 'Good teacher is needed for current Education', a: true),
    Question(q: 'Arrow is better than Iron Fist', a: true),
    Question(q: 'Flutter is better than ReactNative', a: true)
  ];

// for avoidance of app crash

  void nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
    // print(questionNumber);
    // print(questionBank.length);
  }

//_questionBank is private so we create a function to get question text.
  String getQuestionText() {
    return questionBank[questionNumber].questionText;
  }
  //_questionBank is private so we create a function to correctAnswer

  bool getcorrectAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }
}
