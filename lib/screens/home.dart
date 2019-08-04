import 'package:bom_modern/screens/authen.dart';
import 'package:bom_modern/screens/my_service.dart';
import 'package:bom_modern/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //ประกาศตัวแปร
  double myWidth = 200.0;
  String nameApp = 'Fultter workshop';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // double myHeight = 200.0;

  //Method
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future <void> checkStatus()async{

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      
      var myServiceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route <dynamic> route) => false);

    }
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 20.0,
    );
  }

  Widget singUpButton() {
    return Container(
      width: myWidth,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.blue[800]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'sing Up',
          style: TextStyle(color: Colors.blue[800]),
        ),
        onPressed: () {
          print('You Sing Up');
          //Route
          var registerRoute =
              MaterialPageRoute(builder: (BuildContext cintext) => Register());
          Navigator.of(context).push(registerRoute);
        },
      ),
    );
  }

  Widget singInButton() {
    return Container(
      width: myWidth,
      child: RaisedButton(
        color: Colors.blue[300],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Text(
          'Sing In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          var authenRoute = MaterialPageRoute(builder: (BuildContext context) => Authen());
          Navigator.of(context).push(authenRoute);
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: myWidth,
        height: myWidth,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      nameApp,
      style: TextStyle(
        fontSize: 25.0,
        color: Colors.orange[800],
        fontWeight: FontWeight.normal,
        fontFamily: 'Mitr',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue[400]],
            radius: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            singInButton(),
            singUpButton(),
          ],
        ),
      ),
    );
  }
}
