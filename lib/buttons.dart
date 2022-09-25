import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  var child;

  Button({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 123, 129, 243),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            minimumSize: Size(120, 35)),
      ),
    );
  }
}

class Reset extends StatelessWidget {
  final Function()? resetquiz;
  final String text;

  Reset(this.resetquiz, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: resetquiz,
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 123, 129, 243),
              minimumSize: Size(150, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))),
        ));
  }
}
