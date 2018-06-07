import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trivia Quiz'),
        ),
        backgroundColor: Colors.red,
        body: HelloRectangle(),
      ),
    ),
  );
}

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[Container(
          height: 650.0,
          width: 450.0,
        ),
        new Column(
          children: <Widget>[
            Center(
              child: new Padding(
                padding: const EdgeInsets.only(top: 80.0, right: 10.0, left: 10.0),
                child: Container(
                  color: Colors.redAccent,
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
                    padding: const EdgeInsets.only(top:240.0, left:20.0, right: 20.0),
                    child: new RaisedButton(
                        onPressed: null,
                        textColor: Colors.green,
                        color: Colors.redAccent,
                        child: new Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Center(
                            child: Text(
                              'Sign-In',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                        )
                    ),
                  ),
                ),
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(top:240.0, right:20.0, left: 20.0),
                    child: new RaisedButton(
                        onPressed: null,
                        textColor: Colors.green,
                        color: Colors.blue,
                        elevation: 4.0,
                        child: new Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Center(
                            child: Text(
                              'Sign-Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          ],
        )]

    );
  }
}
