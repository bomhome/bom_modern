import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // mothod
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

    await firebaseAuth.signOut().then((response){
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyService'),
      actions: <Widget>[signOutAndExit(),],
      ),
      body: Text('data'),
    );
  }
}
