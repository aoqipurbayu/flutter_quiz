import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz_logic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizLogic questionLogic = QuizLogic();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Quiz",
                style: TextStyle(
                    color: Colors.green, fontSize: 32.0, letterSpacing: 8.0),
              ),
              Text(
                "App",
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ],
          ),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreResult = [
    Text(
      "Hasil : ",
      style: TextStyle(color: Colors.white),
    ),
  ];

  void checkAnswer(bool answer) {
    bool correctAnswer = questionLogic.getAnswerKey();
    setState(() {
      if (questionLogic.isFinish()) {
        Alert(
            context: context,
            type: AlertType.success,
            title: "Quiz Selesai!",
            desc: "Main Ulang Quiz",
            buttons: [
              DialogButton(
                child: Text(
                  "FINISH",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ]).show();
        questionLogic.resetQuestion();
        scoreResult.clear();
      } else {
        if (answer == correctAnswer) {
          scoreResult.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreResult.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionLogic.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: scoreResult,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey),
              child: Text(
                questionLogic.getQuestionNumber().toString() +
                    '/' +
                    questionLogic.getTotalQuestion().toString(),
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionLogic.getQuestion(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red,
                  child: Text(
                    'SALAH',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.green)),
                  textColor: Colors.black,
                  color: Colors.green,
                  child: Text(
                    'BENAR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
