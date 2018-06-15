import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;

class signUpPage extends StatefulWidget {
  @override
  SignUpPage createState() => new SignUpPage();
}

class SignUpPage extends State<signUpPage> {
  String _mymsg = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.help),
              onPressed: () {
                print('Help clicked');
                setState(() {
                  _mymsg = 'Pressed Help';
                });
              }),
        ],
        title: Text(
          'Sign-Up',
        ),
        backgroundColor: Colors.green[500],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Container(
              decoration: new BoxDecoration(
                color: main.primaryColor,
                borderRadius: new BorderRadius.all(const Radius.circular(14.0)),
              ),
              height: 150.0,
              width: 200.0,
              child: Text(
                _mymsg,
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.green[500],
      resizeToAvoidBottomPadding: false,
    );
  }
}
