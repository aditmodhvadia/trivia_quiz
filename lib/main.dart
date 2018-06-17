import 'package:flutter/material.dart';
import './pages/sign_up.dart';
import './pages/sign_in.dart';

Color primaryColor = Colors.redAccent;

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/sign-in': (BuildContext context) => new signInPage(),
        '/sign-up': (BuildContext context) => new signUpPage()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trivia Quiz'),
          backgroundColor: Colors.green[500],
        ),
        body: _mainBody(),
        backgroundColor: Colors.green[500],
      ),
    );
  }
}

class _mainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      Container(height: 650.0, width: 450.0),
      new Column(
        children: <Widget>[
          Center(
            child: new Padding(
              padding:
                  const EdgeInsets.only(top: 80.0, right: 10.0, left: 10.0),
              child: new Container(
                decoration: new BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(14.0)),
                ),
                height: 150.0,
                width: 200.0,
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                      child: Icon(
                        Icons.cake,
                        size: 60.0,
                      ),
                    ),
                    Text(
                      'App Icon',
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(
                      top: 240.0, left: 20.0, right: 20.0),
                  child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/sign-in');
                      },
                      color: primaryColor,
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
                      )),
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(
                      top: 240.0, left: 20.0, right: 20.0),
                  child: new RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/sign-up');
                      },
                      color: primaryColor,
                      elevation: 4.0,
                      splashColor: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Center(
                          child: Text(
                            'Sign-Up',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 30.0),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        ],
      )
    ]);
  }
}
