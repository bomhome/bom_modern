import 'package:bom_modern/screens/my_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  Color myTextColor = Colors.blue[700];
  double myWigth = 300.0;
  final formKey = GlobalKey<FormState>(); //ตรวจสอบเงือนไขโดย Firebase
  String emailString = '',
      passwordSrting = ''; //กำหนดค่าว่างป่าวเพื่อส่งขึ้น Firebase

  // method
  Widget showLogo() {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 80.0,
        height: 80.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showText() {
    return Container(
      // margin: EdgeInsets.only(top: 16),
      child: Text(
        'เข้าสู่ระบบ',
        style: TextStyle(
          fontSize: 24.0,
          color: myTextColor,
          fontFamily: 'Mitr',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: myWigth,
      child: TextFormField(
        style: TextStyle(color: myTextColor),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: myTextColor)),
            icon: Icon(
              Icons.email,
              color: myTextColor,
            ),
            helperText: 'your e-mail',
            helperStyle: TextStyle(color: myTextColor)),
        onSaved: (valueObject) {
          emailString = valueObject.toString();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: myWigth,
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: myTextColor),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: myTextColor)),
            icon: Icon(
              Icons.lock,
              color: myTextColor,
            ),
            helperText: 'Your Password',
            helperStyle: TextStyle(color: myTextColor)),
        onSaved: (value) {
          passwordSrting = value.toString();
        },
      ),
    );
  }

  Widget singInButton() {
    return Container(
      padding: EdgeInsets.only(right: 50.0),
      alignment: Alignment.topRight,
      child: FloatingActionButton(
        backgroundColor: myTextColor,
        child: Icon(
          Icons.navigate_next,
          size: 48.0,
        ),
        onPressed: () {
          formKey.currentState.save();
          print('email=$emailString,password=$passwordSrting');
          cheackAuthen();
        },
      ),
    );
  }

  Future<void> cheackAuthen() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordSrting)
        .then((response) {
      print('Authen Success');

      var myServiceRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context)
          .pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title,message = $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myTextColor,
        title: Text('Authen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue[400]],
            radius: 1.5,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showLogo(),
              showText(),
              emailText(),
              passwordText(),
              singInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
