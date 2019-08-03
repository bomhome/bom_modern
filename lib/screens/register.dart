import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explict
  Color myColor = Color.fromARGB(255, 21, 101, 192);
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

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
      validator: (String value) {
        if (value.isEmpty) {
          return 'plase input your name';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
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
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'keep Email Format your@mail.com';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
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
      validator: (String value) {
        if (value.length < 6) {
          return 'password More 6 Charator';
        }
      },onSaved: (String value){
        passwordString = value;
      },
    );
  }

  Widget uplodeButter() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('your clicke upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $nameString,email = $emailString,password = $passwordString');
        }
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
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
