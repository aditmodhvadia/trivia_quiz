import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;

class signInPage extends StatefulWidget {
  @override
  SignInPage createState() => new SignInPage();
}

class SignInPage extends State<signInPage> {
  Color c = Colors.green[500];
  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();
  String res = 'Pending';
  String _passerr;
  String _usererr;

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
              new Padding(
                padding: const EdgeInsets.all(18.0),
                child: new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(color: Colors.white, fontSize: 22.0),
                  controller: _user,
                  decoration: new InputDecoration(
                    labelText: 'Email ID',

                    errorText: _usererr,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.all(const Radius.circular(14.0)),
                      ),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(18.0),
                child: new TextFormField(
                  controller: _pass,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.white, fontSize: 22.0),
                  decoration: new InputDecoration(
                    errorText: _passerr, //add error text here after resolving the bug of red outline
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(14.0)),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              new Padding(
                padding:
                    const EdgeInsets.only(left: 36.0, top: 8.0, right: 36.0),
                child: new RaisedButton(
                    onPressed: () {
                      print('Sign In pressed');
                      setState(() {
                        //Testing onpress works and gets email id and password

                        if (_pass.text.length < 6) {
                          _passerr = 'Password should be more than 6 characters';
                          return;
                        }

                        if(_user.text.isEmpty){
                          _usererr = 'Please enter Email ID';
                          return ;
                        }
                        if(!_user.text.contains('@')){
                          _usererr = 'Please enter valid Email ID';
                          return;
                        }
                        res = _user.text + ' ' + _pass.text;
                        _passerr = null;
                        _usererr = null;
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
                          style: TextStyle(color: Colors.black, fontSize: 30.0),
                        ),
                      ),
                    )),
              ),
              new Padding(
                padding: const EdgeInsetsDirectional.only(top: 18.0),
                child: new Center(
                  child: new Text(
                    res,
                  ),
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
