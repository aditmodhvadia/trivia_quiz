import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';


class dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        elevation: 4.0,
      ),
      body: dashBody(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
        isExtended: true,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.exit_to_app),
        ],
      ),),
    );
  }
}

class dashBody extends StatefulWidget {
  @override
  _dashBodyState createState() => _dashBodyState();
}

class _dashBodyState extends State<dashBody> {

  String name = 'waiting';
  Future<FirebaseUser> _user =  FirebaseAuth.instance.currentUser();

  Future<String> _handleSignIn() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print("signed in " + user.email);
    return user.email;
  }


  @override
  void initState() {
    _handleSignIn().then((String returned){
      name = returned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: new AssetImage('assets/quiz_bg.jpg'),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(name, style: TextStyle(color:Colors.white, fontSize: 26.0),),

          ],
        )

      ],
    );
  }
}


