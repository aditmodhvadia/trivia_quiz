import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;

class signUpPage extends StatefulWidget {
  @override
  SignUpPage createState() => new SignUpPage();
}

class SignUpPage extends State<signUpPage> {
  String _mymsg = 'Welcome';

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

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
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(14.0),
                child: new Icon(
                  Icons.email,
                  size: 32.0,
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                  child: new TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                        labelText: 'Email ID',
                        helperText: '*Required',
                        border: OutlineInputBorder(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(14.0)),
                        )),
                  ),
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(14.0),
                child: new Icon(
                  Icons.vpn_key,
                  size: 32.0,
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                  child: new TextField(
                    obscureText: true,
                    controller: _pass,
                    decoration: new InputDecoration(
                        labelText: 'Password',
                        hintText: 'Minimum 6 characters',
                        border: OutlineInputBorder(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(14.0)),
                        )),
                  ),
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(18.0),
            child: new RaisedButton(
              onPressed: () {
                print('Sign-up clicked');
              },
              color: main.primaryColor,
              elevation: 4.0,
              splashColor: Colors.blueAccent,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: new Padding(
                padding: const EdgeInsets.all(14.0),
                child: new Text(
                  'Sign-Up',
                  style: TextStyle(color: Colors.black, fontSize: 26.0),
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
