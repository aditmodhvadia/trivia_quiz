import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;

class signInPage extends StatefulWidget {
  @override
  SignInPage createState() => new SignInPage();
}

class SignInPage extends State<signInPage> {
  Color c = Colors.green[500];
  String emailId, password;
  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();
  String res = 'Pending';

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
                  c = Colors.teal;
                  res = 'Help pressed';
                });
              }),
        ],
        title: Text(
          'Sign-In',
        ),
        backgroundColor: c,
      ),
      body: new Padding(
        padding: const EdgeInsets.all(28.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: _user,
                decoration: new InputDecoration(
                    icon: new Icon(Icons.email),
                    hintText: 'Enter Registered Email ID'),
              ),
              new TextField(
                controller: _pass,
                decoration: new InputDecoration(
                  icon: new Icon(Icons.vpn_key), hintText: 'Enter Password'),
                  obscureText: true,
              ),
              new Padding(
                padding: const EdgeInsets.only(
                  left: 36.0,
                  top: 8.0,
                  right: 36.0
                ),
                child: new RaisedButton(
                  onPressed: () {
                    print('Sign In pressed');
                    setState(() {
                      //Testing onpress works and gets email id and password
                        res = _user.text +' ' +_pass.text;
                        c = Colors.green[500];
                    });
                },
                    color: main.primaryColor,
                    elevation: 4.0,
                    splashColor: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Center(
                        child: Text(
                          'Sign-In',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Colors.black, fontSize: 30.0),
                        ),
                      ),
                    )
                ),
              ),
              new Center(
                child: new Text(
                  res,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: c,
      resizeToAvoidBottomPadding: false,
    );
  }
}
