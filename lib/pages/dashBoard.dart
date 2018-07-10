import 'package:flutter/material.dart';
import 'sign_in.dart';


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

      },
      child:Row(
        children: <Widget>[
          Icon(Icons.exit_to_app),
          Text('Logout')
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

      ],
    );
  }
}


