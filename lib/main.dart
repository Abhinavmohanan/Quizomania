import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Quizomania/result.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

//Stateless doesnt have any state i.e doesnt change ,eg. text outputted , it only reloads when external data changes *****
//stateful has internal state which when changed triggers a reload

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateMyApp();
  }
} // still immutable and cant be changed but setting a state will reload it

class _StateMyApp extends State<MyApp> {
  //_ = private class
  //State is mutable and can be changed , can be set
  int index = 0;
  int tscore = 0;
  int? highscore;

  Future<int?> getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    print("Value of score is ${prefs.getInt('highscore')}");
    return prefs.getInt('highscore');
  }

  Future<void> resetHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('highscore', 0);
      highscore =
          prefs.getInt('highscore'); //Updating highscore so it reflects in app
    });
  }

  void quesanswered(bool ans) async {
    if (ans) {
      tscore += 1;
    }
    final prefs = await SharedPreferences.getInstance();
    highscore = prefs.getInt('highscore') ?? 0;
    setState(() {
      index++;
      if (!(index < q.length) && highscore! < tscore) {
        prefs.setInt('highscore', tscore);
        print("High score set as $highscore");
      }
    }); //calls build again
    highscore = prefs.getInt('highscore'); //Reupdate highscore
    //await prefs.remove('highscore'); Reset highscore
    print("Question is answered");
  }

  void resetquiz() {
    setState(() {
      index = 0;
      tscore = 0;
    });
  }

  // variable stores pointer to the object
  dynamic q = [
    // if var , it will assign object type to all rhs and hence we cannot access list items
    {
      'questionText': '5+10 ',
      "answer": [
        {'text': '0', 'ans': false},
        {'text': '10', 'ans': false},
        {'text': '15', 'ans': true},
        {'text': '20', 'ans': false},
      ]
    },
    {
      "questionText": "55 * 100",
      "answer": [
        {'text': '1000', 'ans': false},
        {'text': '2000', 'ans': false},
        {'text': '5500', 'ans': true},
      ],
    },
    {
      "questionText": "19 + ___ = 42",
      "answer": [
        {'text': '23', 'ans': true},
        {'text': '61', 'ans': false},
        {'text': '0', 'ans': false},
        {'text': '42', 'ans': false},
      ],
    },
    {
      "questionText": "90 – 19",
      "answer": [
        {'text': '71', 'ans': true},
        {'text': '109', 'ans': false},
        {'text': '89', 'ans': false},
        {'text': 'None of these', 'ans': false},
      ],
    },
    {
      "questionText": "20 is divisible by",
      "answer": [
        {'text': '1', 'ans': true},
        {'text': '3', 'ans': false},
        {'text': '7', 'ans': false},
      ],
    },
    {
      "questionText": "190 – 87 + 16",
      "answer": [
        {'text': '103', 'ans': false},
        {'text': '261', 'ans': false},
        {'text': '87', 'ans': false},
        {'text': '119', 'ans': true},
      ],
    },
    {
      "questionText": "What is three fifth of 100",
      "answer": [
        {'text': ' 3', 'ans': false},
        {'text': '5', 'ans': false},
        {'text': '20', 'ans': false},
        {'text': '60', 'ans': true},
      ],
    },
    {
      "questionText": "What is the square of 15",
      "answer": [
        {'text': '15', 'ans': false},
        {'text': '225', 'ans': true},
        {'text': '625', 'ans': false},
      ],
    },
    {
      "questionText": "21 % 7 ",
      "answer": [
        {'text': '21', 'ans': false},
        {'text': '7', 'ans': false},
        {'text': '3', 'ans': false},
        {'text': 'None of these', 'ans': true},
      ],
    },
    {
      "questionText": "99 % 2",
      "answer": [
        {'text': '1', 'ans': true},
        {'text': '0', 'ans': false},
        {'text': '2', 'ans': false},
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text("Quizomania")),
      body: index < q.length
          ? Quiz(q, quesanswered, index)
          : Result(resetquiz, tscore, highscore, resetHighScore),
    ));
  }
}
