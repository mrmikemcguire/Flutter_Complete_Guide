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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
  });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
    else {
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
            questions: _questions,)
          : Result(),
      ),
    );
  } 
}
  
