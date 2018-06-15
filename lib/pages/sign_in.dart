import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;

class signInPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new Container(
            height: 200.0,
            width: 200.0,
            color: main.primaryColor,
          ),
        ),
        new Center(
          child: new Container(
            height: 80.0,
            width: 80.0,
            color: Colors.blueAccent,
            child: new Center(
              child: Text(
                'Sign-In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

}