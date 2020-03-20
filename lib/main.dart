import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); // return newMyAppState Obejct base on MyAppState class
  }
}

class _MyAppState extends State<MyApp> {
  // ( _MyAppState) private tidak bisa diakses oleh file manapun
  var _totalScore = 0;
  var _questionIndex = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answer': [
        {'text': 'Green', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Eagle', 'score': 3},
        {'text': 'Tiger', 'score': 11},
        {'text': 'Lion', 'score': 5},
        {'text': 'Elephant', 'score': 9},
      ]
    },
    {
      'questionText': 'Where is Google company Form?',
      'answer': [
        {'text': 'England', 'score': 1},
        {'text': 'US', 'score': 1},
        {'text': 'Germany', 'score': 1},
        {'text': 'Can', 'score': 1},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  //jgn buat function di luar class, jika suatu function ada hubungannya dgn class itu(Standlone)\
  // tipenya void karena button hanya bisa return void maka functionya void
  void _answerQuestion(int score) {
    // yg dimasukkin ke dalam onPressed itu cuman nama function nya aja tanpa '()'
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We Have More Question');
    } else {
      print('Out Of Question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Home Adalah core widget yang akan membawa semua widget ke screen
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
