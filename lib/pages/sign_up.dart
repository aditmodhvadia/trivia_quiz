import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;

class signUpPage extends StatefulWidget {
  @override
  SignUpPage createState() => new SignUpPage();
}

class SignUpPage extends State<signUpPage> {

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();
  static final TextEditingController _name = new TextEditingController();
  static final TextEditingController _phone = new TextEditingController();
  static final TextEditingController _conpass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        actions: <Widget>[
          new Builder(
            builder: (BuildContext context1){
              return new IconButton(
              icon: new Icon(Icons.help),
              onPressed: () {
              print('Help clicked');
              final _helpsnackbar = SnackBar(
              content: Text('Help Pressed'),
              action: SnackBarAction(
              label: 'OK!',
              onPressed: () => print('OK Pressed'),
              ),
              );
              Scaffold.of(context1).showSnackBar(_helpsnackbar);
              });
            },
          ),
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
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: new Icon(
                    Icons.person,
                    size: 32.0,
                  ),
                ),
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                    child: new TextField(
                      keyboardType: TextInputType.text,
                      controller: _name,
                      decoration: new InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter your Full Name',
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.all(const Radius.circular(14.0)),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: new Icon(
                    Icons.phone,
                    size: 32.0,
                  ),
                ),
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                    child: new TextField(
                      keyboardType: TextInputType.phone,
                      controller: _phone,
                      decoration: new InputDecoration(
                          labelText: 'Contact Number',
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.all(const Radius.circular(14.0)),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
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
                      controller: _user,
                      decoration: new InputDecoration(
                          labelText: 'Email ID',
                          border: OutlineInputBorder(
                            borderRadius:
                                new BorderRadius.all(const Radius.circular(14.0)),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
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
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
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
                      controller: _conpass,
                      decoration: new InputDecoration(
                          labelText: 'Confirm Password',
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
