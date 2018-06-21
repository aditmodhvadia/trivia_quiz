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

  String _gender='Male';
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
      body: new SingleChildScrollView(
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
                      padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                      child: new TextField(
                        keyboardType: TextInputType.text,
                        controller: _name,
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
                      padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                      child: new TextField(
                        keyboardType: TextInputType.phone,
                        controller: _phone,
                        decoration: new InputDecoration(
                            labelText: 'Contact Number',
                            helperText: '*Optional',
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
                        },),
                      new Text('Male'),
                      new Radio(
                        value: 'Female',
                        groupValue: _gender,
                        onChanged: (String value) {
                          onGenderChanged(value);
                        },),
                      new Text('Female'),
                      new Radio(
                        value: 'Other',
                        groupValue: _gender,
                        onChanged: (String value) {
                          onGenderChanged(value);
                        },),
                      new Text('Other')
                    ],
                  ),
                )
              ],
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
                      padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                      child: new TextField(
                        obscureText: true,
                        controller: _pass,
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
                      padding: const EdgeInsets.only(top: 7.0, right: 28.0),
                      child: new TextField(
                        obscureText: true,
                        controller: _conpass,
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
              child: new RaisedButton(
                onPressed: (){
                  setState(() {
                    validate();
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
                    style: TextStyle(color: Colors.black, fontSize: 26.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.green[500],
      resizeToAvoidBottomPadding: false,
    );
  }

  void validate(){
    _nameerr = null;
    _emailerr = null;
    _passerr = null;
    _conpasserr = null;

    if(_name.text.isEmpty){
      _nameerr = 'Enter your Full Name';
      return;
    }
    if(_phone.text.isNotEmpty && _phone.text.length!=10){//Phone number is not required
      _nameerr = 'Enter your 10 digit Mobile Number';
      return;
    }
    if(_user.text.isEmpty){
      _emailerr = 'Enter your Email ID';
      return;
    }
    if(_pass.text.isEmpty){
      _passerr = 'Enter Password';
      return;
    }
    if(_conpass.text.isEmpty){
      _conpasserr = 'Enter Password';
      return;
    }
    if(!_user.text.contains('@')){
      _emailerr = 'Enter proper Email ID';
      return;
    }

    /*
    SnackBar snackbar = new SnackBar(content: new Text(_name.text +' '+_user.text));
    Scaffold.of(context).showSnackBar(snackbar);
    */

    print('sign up clicked');

  }

  void onGenderChanged(String value){
    _gender = value;
    print(_gender);
  }

  //void email(String value) => _name.text=value;

}
