import 'package:flutter/material.dart';
import 'question.dart';
import 'buttons.dart';

class Result extends StatelessWidget {
  final resetquiz;
  final tscore;
  final highscore;
  final resetscore;

  Result(this.resetquiz, this.tscore, this.highscore, this.resetscore);

  dynamic get() {
    if (tscore > 1) {
      return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold), //Overall Styking
              children: [
                const TextSpan(text: "Awesome Work !\n Score: "),
                TextSpan(
                    text: "$tscore",
                    style:
                        TextStyle(color: Color.fromARGB(255, 254, 114, 104))),
                const TextSpan(text: "\n High Score: "),
                TextSpan(
                    text: "$highscore",
                    style: TextStyle(color: Color.fromARGB(255, 200, 101, 94)))
              ]));
    } else {
      return RichText(
          text: TextSpan(
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              children: [
            const TextSpan(text: "Try Again,\n Score: "),
            TextSpan(
                text: "$tscore",
                style: TextStyle(color: Color.fromARGB(255, 200, 101, 94))),
            const TextSpan(text: "\n High Score: "),
            TextSpan(
                text: "$highscore",
                style: TextStyle(color: Color.fromARGB(255, 200, 101, 94)))
          ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: get(),
      ),
      Row(
        children: [
          Reset(resetquiz, "Retry Quiz"),
          Reset(resetscore, "Reset Highscore")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )
    ]);
  }
}
