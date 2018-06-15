import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;

class signInPage extends StatefulWidget {
  @override
  SignInPage createState() => new SignInPage();
}

class SignInPage extends State<signInPage> {
  String _mymsg = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 4.0,
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
          'Sign-In',
        ),
        backgroundColor: Colors.green[500],
      ),
      body: new Stack(
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
                  _mymsg,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
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
