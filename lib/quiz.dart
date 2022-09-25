import 'package:flutter/material.dart';
import 'question.dart';
import 'buttons.dart';

class Quiz extends StatelessWidget {
  final q;
  final quesanswered;
  final index;

  Quiz(this.q, this.quesanswered, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question("${index + 1}) ${q[index]['questionText']}"),
        ...(q[index]["answer"]).map((eachanswer) {
          return Button(
              onPressed: () => quesanswered(eachanswer['ans']),
              child: Text(eachanswer['text']));
        }),
      ],
    );
  }
}
