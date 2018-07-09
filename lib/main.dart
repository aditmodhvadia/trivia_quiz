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
      title: 'Trivia Quiz',
      routes: <String, WidgetBuilder>{
        '/sign-in': (BuildContext context) => new signInPage(),
        '/sign-up': (BuildContext context) => new signUpPage()
      },
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trivia Quiz'),
          backgroundColor: Colors.green[500],
        ),
        body: _mainBody(),
      ),
    );
  }
}

class _mainBody extends StatefulWidget{
  @override
  State createState() => new _mainBodyState();
}

class _mainBodyState extends State<_mainBody> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(parent: _iconAnimController, curve: Curves.easeInOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimController.forward();

  }
  @override
  void dispose() {
    _iconAnimController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage('assets/quiz_bg.jpg'),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlutterLogo(
              size: _iconAnimation.value * 140,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(
                        top: 180.0, left: 20.0, right: 20.0),
                    child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/sign-in');
                          //Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false); this is for
                          //showing a page directly without the back arrow in the app bar
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
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.0),
                            ),
                          ),
                        )),
                  ),
                ),
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(
                        top: 180.0, left: 20.0, right: 20.0),
                    child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/sign-up');
                          //Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false); this is for
                          //showing a page directly without the back arrow in the app bar
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
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.0),
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
