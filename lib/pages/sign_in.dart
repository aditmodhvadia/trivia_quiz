import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class signInPage extends StatefulWidget {
  @override
  SignInPage createState() => new SignInPage();
}

class SignInPage extends State<signInPage> {

  FocusNode emailFocus = new FocusNode();
  FocusNode passFocus = new FocusNode();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference db = FirebaseDatabase.instance.reference();
  
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
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/quiz_bg.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Theme(
            data: ThemeData(
              brightness: Brightness.dark,
            ),
            child: new Padding(
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
                        autocorrect: true,
                        focusNode: emailFocus,
                        autofocus: true,
                        decoration: new InputDecoration(
                          labelText: 'Email ID',
                          hintText: 'Enter your Email ID',
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
                        autocorrect: false,
                        focusNode: passFocus,
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
                          onPressed: () => _signIn(context),
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
          ),
        ],
      ),
      backgroundColor: c,
      resizeToAvoidBottomPadding: false,
    );
  }
  
  void _signIn(BuildContext context){
    print('Sign In pressed');
    setState(() {
      _passerr = null;
      _usererr = null;

      if (_pass.text.length < 6) {
        _passerr = 'Password should be more than 6 characters';
        FocusScope.of(context).requestFocus(passFocus);
        return;
      }

      if(_user.text.isEmpty){
        _usererr = 'Please enter Email ID';
        FocusScope.of(context).requestFocus(emailFocus);
        return ;
      }
      if(!_user.text.contains('@')){
        _usererr = 'Please enter valid Email ID';
        FocusScope.of(context).requestFocus(emailFocus);
        return;
      }
      c = Colors.green[500];
      
      _handleSignIn(context).whenComplete((){
        print('Sign In done in method call');
      }).catchError((e) {
        print(e);
      });
      
    });
  }

  Future<FirebaseUser> _handleSignIn(BuildContext context2) async {
    final FirebaseUser curr = await _auth.signInWithEmailAndPassword(
        email: _user.text.trim(), password: _pass.text).catchError((e) => print(e));

    
    if(curr.isEmailVerified){
      print('sign in complete');
    }
    else{
      SnackBar verifyEmailSnackbar =
      new SnackBar(content: Text('Verify your Email ID and then Sign In'));
      
      Scaffold.of(context2).showSnackBar(verifyEmailSnackbar);
    }
    
    return curr;
  }

  @override
  void dispose(){
    _user.dispose();
    _pass.dispose();
    super.dispose();
  }
  
}
