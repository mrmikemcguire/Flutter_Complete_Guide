import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './result.dart';
import './quiz.dart';

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
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 7},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Red', 'score': 12}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Wombat', 'score': 15},
        {'text': 'Dog', 'score': 9},
        {'text': 'Cat', 'score': 3},
        {'text': 'Platypus', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite snack?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Blue', 'score': 10},
        {'text': 'Blue', 'score': 10},
        {'text': 'Blue', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
