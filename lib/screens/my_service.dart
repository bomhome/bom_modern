import 'dart:io';

import 'package:bom_modern/screens/add_value.dart';
import 'package:bom_modern/screens/home_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameLoginString = '';
  Widget myWidget = HomeService();
  

  // mothod

  @override
  void initState() {
    super.initState();
    findLogin();
  }

  Future<void> findLogin() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameLoginString = firebaseUser.displayName;
    });
    print('name = $nameLoginString');
  }

  Widget showAppName() {
    return Text(
      'Flutter workshop',
      style: TextStyle(fontFamily: 'Mitr'),
    );
  }

  Widget showLogin() {
    return Text(
      'Login By $nameLoginString',
      style: TextStyle(fontStyle: FontStyle.italic),
    );
  }

  Widget showImage() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [Colors.white, Colors.blue[700]],
        radius: 1.5,
      )),
      child: Column(
        children: <Widget>[
          showImage(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showHome() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('Home'),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        setState(() {
          myWidget = HomeService();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget addValue() {
    return ListTile(
      leading: Icon(Icons.add_box),
      title: Text('add Value'),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        setState(() {
          myWidget = AddValue();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget signOutExit() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('sign Out and Exit'),
      trailing: Icon(Icons.navigate_next),onTap: (){
        signOutAndExit();
      },
    );
  }

  Widget myDrawermenu() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        myHeadDrawer(),
        showHome(),
        addValue(),
        signOutExit(),
      ],
    ));
  }

  Widget signOutAndExit() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      tooltip: 'Sing Out and Exit',
      onPressed: () {
        signoutThread();
      },
    );
  }

  Future<void> signoutThread() async {
    await firebaseAuth.signOut().then((response) {
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyService'),
        actions: <Widget>[
          signOutAndExit(),
        ],
      ),
      body: myWidget,
      drawer: myDrawermenu(),
    );
  }
}
