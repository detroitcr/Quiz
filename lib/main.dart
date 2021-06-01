// import 'package:flutter/material.dart';
//
// void main() => runApp(Quizzler());
//
// class Quizzler extends StatelessWidget {
//   const Quizzler({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey.shade900,
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class QuizPage extends StatefulWidget {
//   const QuizPage({Key key}) : super(key: key);
//
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }
//
// class _QuizPageState extends State<QuizPage> {
//   List<Icon> scoreKeeper = [
//     Icon(
//       Icons.check,
//       color: Colors.green,
//     ),
//     Icon(
//       Icons.close,
//       color: Colors.red,
//     ),
//     Icon(
//       Icons.close,
//       color: Colors.red,
//     ),
//     Icon(
//       Icons.close,
//       color: Colors.red,
//     ),
//     Icon(
//       Icons.close,
//       color: Colors.red,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 'yaha se cr ka raaz shuru',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: FlatButton(
//               textColor: Colors.white,
//               color: Colors.green,
//               child: Text(
//                 'True',
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {
//                 setState(
//                   () {
//                     scoreKeeper.add(
//                       Icon(
//                         Icons.check,
//                         color: Colors.green,
//                       ),
//                     );
//                   },
//                 );
//
//                 //user will decide
//               },
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: FlatButton(
//               textColor: Colors.white,
//               color: Colors.green,
//               child: Text(
//                 'False',
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {
//                 // user will decide
//               },
//             ),
//           ),
//         ),
//         Row(
//           children: scoreKeeper,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'quiz_brain.dart';

//create a object quizBrain so we can access quizbrain class

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Container> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer =

        //quizBrain.questionBank[QuestionNumber].questionAnswer;
        quizBrain.getcorrectAnswer();
    setState(
      () {
        if (quizBrain.questionNumber < quizBrain.questionBank.length - 1) {
          if (userPickedAnswer == correctAnswer) {
            scoreKeeper.add(
              Container(
                width: MediaQuery.of(context).size.width / 20,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            );
          } else {
            scoreKeeper.add(
              Container(
                width: MediaQuery.of(context).size.width / 20,
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            );
          }
        }

        quizBrain.nextQuestion();
      },
    );
  }

  // List<String> Questions = [
  //   'Doge is future in cryptocurrency',
  //   'Can Doge beat bitcoin in next five years',
  //   'Is Emperor kumar beat elon musk in future',
  // ];
  //
  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  // ];
  // Question q1 = Question(q:'Doge is future in cryptocurrency',a: true, );

  // for easy we will make a list of above questions

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //quizBrain is object of QuizBrain class and this is the way of connecting or getting the data from another class

                //quizBrain.questionBank[QuestionNumber].questionText,
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                print(
                  'The question number pressed is ${quizBrain.questionNumber}',
                );
                if (quizBrain.questionNumber ==
                    quizBrain.questionBank.length - 1) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          height: 200,
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning,
                                color: Colors.red,
                                size: 50,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(
                                    () {
                                      scoreKeeper = [];
                                      quizBrain.questionNumber = 0;
                                    },
                                  );
                                },
                                color: Colors.red.shade400,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Play agoon',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                // user will picked true
                // setState(() {
                //   scoreKeeper.add(
                //     Icon(Icons.check, color: Colors.green),
                //   );
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (quizBrain.questionNumber == quizBrain.questionBank.length) {
                  print('last question');
                }
                // user picked false

                // bool correctAnswer =
                //     //quizBrain.questionBank[QuestionNumber].questionAnswer;
                //     quizBrain.getcorrectAnswer();
                // if (correctAnswer == false) {
                //   print('user is right');
                // } else {
                //   print('user got it wrong');
                // }
                // setState(() {
                //   quizBrain.nextQuestion();
                // });
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
