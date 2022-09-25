import 'package:flutter/material.dart';

//Modularising

class Question extends StatelessWidget {
  final String
      ques; //final to say that it cant be changed internally , changing internally wont produce any effect as it is stateless but it can be changed while creation

  Question(this.ques); //constructor

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, //or it will wrap around text
        margin: EdgeInsets.all(20), //hover over margin to get what to input
        child: Text(
          ques,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28),
        )); //Whenever value of ques changes (i.e external data supplied) build is called as it is a StatelessWidget and change is produced in app (ref stateless widget)
  }
}
