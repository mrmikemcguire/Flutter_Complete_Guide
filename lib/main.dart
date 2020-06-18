import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main(List<String> args) {
  runApp(MyApp());
}
// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
        _questionIndex++;
    });
 
    print(_questionIndex);
  }
  @override
  Widget build(BuildContext context) {
    var questions = [
      {'questionText':'What\'s your favorite color?',
       'answers': ['Blue', 'Red', 'Green', 'Yellow'],
      },
      {'questionText':'What\'s your favorite animal?',
       'answers': ['Dog', 'Cat', 'Dolphin', 'Wombat'],
      },
      {'questionText':'What\'s your favorite snack?',
       'answers': ['M&Ms', 'Cookies', 'chips', 'bars'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'], //map access
              ),
              ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          ),
        ),
      );
  } // build
}
  
