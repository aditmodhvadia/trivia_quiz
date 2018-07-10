import 'package:flutter/material.dart';
import 'package:trivia_quiz/main.dart' as main;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  DatabaseReference db = FirebaseDatabase.instance.reference();

  static DateTime _date = new DateTime.now();

  String _gender = 'Male', bDate = 'Select Date of Birth';
  String _nameerr, _emailerr, _passerr, _conpasserr;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        actions: <Widget>[
          new Builder(
            builder: (BuildContext context1) {
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
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/quiz_bg.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new SingleChildScrollView(
            child: Theme(
              data: new ThemeData(
                  brightness: Brightness.dark, primarySwatch: Colors.red),
              child: new Column(
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
                            padding:
                                const EdgeInsets.only(top: 7.0, right: 28.0),
                            child: new TextField(
                              keyboardType: TextInputType.text,
                              controller: _name,
                              autocorrect: true,
                              autofocus: true,
                              decoration: new InputDecoration(
                                  labelText: 'Full Name',
                                  hintText: 'Enter your Full Name',
                                  errorText: _nameerr,
                                  border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(14.0)),
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
                            padding:
                                const EdgeInsets.only(top: 7.0, right: 28.0),
                            child: new TextField(
                              keyboardType: TextInputType.phone,
                              controller: _phone,
                              autocorrect: false,
                              decoration: new InputDecoration(
                                  labelText: 'Contact Number',
                                  helperText: '*Optional',
                                  hintText: '10 Digit Number',
                                  helperStyle: new TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(14.0)),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(left: 44.0),
                        child: new Row(
                          children: <Widget>[
                            new Radio(
                              value: 'Male',
                              groupValue: _gender,
                              onChanged: (String value) {
                                onGenderChanged(value);
                              },
                            ),
                            new Text('Male', style: TextStyle(color: Colors.white)),
                            new Radio(
                              value: 'Female',
                              groupValue: _gender,
                              onChanged: (String value) {
                                onGenderChanged(value);
                              },
                            ),
                            new Text('Female', style: TextStyle(color: Colors.white)),
                            new Radio(
                              value: 'Other',
                              groupValue: _gender,
                              onChanged: (String value) {
                                onGenderChanged(value);
                              },
                            ),
                            new Text('Other', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: new RaisedButton(
                            onPressed: () => _selectDate(context),
                            child: Text('Date Of Birth', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        new Text(bDate,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                            ))
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
                            padding:
                                const EdgeInsets.only(top: 7.0, right: 28.0),
                            child: new TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _user,
                              autocorrect: true,
                              decoration: new InputDecoration(
                                  labelText: 'Email ID',
                                  errorText: _emailerr,
                                  border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(14.0)),
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
                            padding:
                                const EdgeInsets.only(top: 7.0, right: 28.0),
                            child: new TextField(
                              obscureText: true,
                              controller: _pass,
                              autocorrect: false,
                              decoration: new InputDecoration(
                                  labelText: 'Password',
                                  errorText: _passerr,
                                  hintText: 'Minimum 6 characters',
                                  border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(14.0)),
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
                            padding:
                                const EdgeInsets.only(top: 7.0, right: 28.0),
                            child: new TextField(
                              obscureText: true,
                              controller: _conpass,
                              autocorrect: false,
                              decoration: new InputDecoration(
                                  labelText: 'Confirm Password',
                                  hintText: 'Minimum 6 characters',
                                  errorText: _conpasserr,
                                  border: OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(14.0)),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Builder(builder: (BuildContext context2) {
                      return new RaisedButton(
                        onPressed: () {
                          setState(() {
                            validate(context2);
                          });
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 26.0),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green[500],
      resizeToAvoidBottomPadding: false,
    );
  }

  void validate(BuildContext context2) {
    _nameerr = null;
    _emailerr = null;
    _passerr = null;
    _conpasserr = null;

//    Sample for insreting values to database from shreesh
// refer the method below as well

//    db.child('test').child('value').once().then((DataSnapshot snapshot){
//      print(snapshot.value);
//
//    });

//    db.child('UserData').child('Adit').push().set(<String, String>{
//      'testing' : 'works',
//      'next' : 'yes this also'
//    });
//
//    db.child('UserData').child('Adit').once().then((DataSnapshot snapshot){
//      print(snapshot.value);
//
//    });

//    db.once().then((DataSnapshot snapshot){
//      print(User.fromSnapshot(snapshot).EmailId);
//    });

    if (_name.text.isEmpty) {
      _nameerr = 'Enter your Full Name';
      return;
    }
    if (_phone.text.isNotEmpty && _phone.text.length != 10) {
      //Phone number is not required
      _nameerr = 'Enter your 10 digit Mobile Number';
      return;
    }
    if (bDate == 'Select Date of Birth') {
      SnackBar snackBar =
          new SnackBar(content: new Text('Enter your Birth Date'));
      Scaffold.of(context2).showSnackBar(snackBar);
      return;
    }
    if (_user.text.isEmpty) {
      _emailerr = 'Enter your Email ID';
      return;
    }
    if (_pass.text.isEmpty) {
      _passerr = 'Enter Password';
      return;
    }
    if (_conpass.text.isEmpty) {
      _conpasserr = 'Enter Password';
      return;
    }
    if (!_user.text.contains('@')) {
      _emailerr = 'Enter proper Email ID';
      return;
    }
    if (_pass.text.length < 8) {
      _passerr = 'Password should be atleast 8 characters long';
    }
    if (_conpass.text != _pass.text) {
      _conpasserr = 'Passwords should match';
      _passerr = 'Passwords should match';
    }

    /*db.child('test').onChildChanged.listen((Event event){
      print(event.snapshot.value);
    });
    */

    _handleCreateUser(context2)
        .then((FirebaseUser user) => print(user.email))
        .catchError((e) => print(e.toString()));

    print('sign up clicked');
  }

  Future<FirebaseUser> _handleCreateUser(BuildContext context2) async {
    final FirebaseUser curr = await _auth.createUserWithEmailAndPassword(
        email: _user.text.trim(), password: _pass.text);

    _auth.signInWithEmailAndPassword(email: _user.text, password: _pass.text);
    SnackBar verifyEmailSnackbar =
        new SnackBar(content: Text('Verify your Email ID and then Sign In'));
    curr
        .sendEmailVerification()
        .whenComplete(
            () => Scaffold.of(context2).showSnackBar(verifyEmailSnackbar))
        .whenComplete(() => Future.delayed(Duration(seconds: 3)))
        .whenComplete(() {
          db.child('Users').child(_user.text.replaceAll(".", ",")).set({
            "Name": _name.text,
            "PhoneNo": _phone.text,
            "DOB": bDate,
            "Gender": _gender.toString()
          });
        })
        .whenComplete(() => Future.delayed(Duration(seconds: 1)))
        .whenComplete(() => Navigator.of(context2).pushNamedAndRemoveUntil(
            '/sign-in', (Route<dynamic> route) => false));

    return curr;
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime(1997),
        firstDate: new DateTime(1950),
        lastDate: _date.subtract(Duration(days: 3652)));

    if (picked != null && picked != _date) {
      setState(() {
        bDate = picked.day.toString() +
            '/' +
            picked.month.toString() +
            '/' +
            picked.year.toString();
      });
    }
  }

  void onGenderChanged(String value) {
    setState(() {
      _gender = value;
    });
    print(_gender);
  }
}