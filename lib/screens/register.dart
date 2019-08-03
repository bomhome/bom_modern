import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explict
  Color myColor = Color.fromARGB(255, 21, 101, 192);

  //Method

  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.green[600]),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        icon: Icon(
          Icons.account_box,
          color: Colors.green,
          size: 36.0,
        ),
        labelText: 'Name : ',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'Type Display name',
        helperStyle: TextStyle(color: Colors.green),
        hintText: 'English Only',
      ),
    );
  }

Widget emailText() {
    return TextFormField(
      style: TextStyle(color: Colors.orange[600]),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        icon: Icon(
          Icons.email,
          color: Colors.orange,
          size: 36.0,
        ),
        labelText: 'E-mail : ',
        labelStyle: TextStyle(color: Colors.orange),
        helperText: 'Type your E-mail',
        helperStyle: TextStyle(color: Colors.orange),
        hintText: 'youremail@mail.com',
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: Colors.red[600]),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        icon: Icon(
          Icons.https,
          color: Colors.red,
          size: 36.0,
        ),
        labelText: 'Password : ',
        labelStyle: TextStyle(color: Colors.red),
        helperText: 'Type your password',
        helperStyle: TextStyle(color: Colors.red),
        hintText: '6-12 char',
      ),
    );
  }

  Widget uplodeButter() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('your clicke upload');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[uplodeButter()],
        backgroundColor: myColor,
        title: Text('Register'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 24.0),
          width: 250.0,
          child: Column(
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
