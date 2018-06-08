import 'package:flutter/material.dart';

class signUpPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return new Stack(
      children: <Widget>[
        new Center(
          child: new Container(

            decoration: new BoxDecoration(
              color: Colors.redAccent,
              borderRadius:
              new BorderRadius.all(const Radius.circular(14.0)),
            ),
            height: 150.0,
            width: 200.0,
            child: Text(
              'Sign-Up',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 28.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );

  }

}