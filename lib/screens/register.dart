import 'package:bom_modern/screens/my_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explict
  Color myColor = Color.fromARGB(255, 21, 101, 192);
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
      },
      onSaved: (String value) {
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
          print(
              'name = $nameString,email = $emailString,password = $passwordString');
          registerFirebase();
        }
      },
    );
  }

  //สร้างตัวสมัครสมาชิก
  Future<void> registerFirebase() async {
    //สร้าง Instace เพื่อขอข้อมูลและแสดงข้อมูล
    //ตัวคำสั่งที่ต้องการให้ทำอะไร
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('การสมัครเสร็จสิน กรุณายืนยัน E-mail');
      setUpDisplayName();
    }).catchError((response) {
      print('Error กรุณาตรวจสอบการมัครอีกครั้ง ${response.toString()}');
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  //  สร้างตัวแสดงชื่อผู้ใช้
  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nameString;
      response.updateProfile(userUpdateInfo);

      var myServiceRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route <dynamic> route) => false);
      
    });
  }

  // FlatButton คือปุ่มที่ไม่มีพื้นหลัง
  Widget alerButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget showTitle(String tileString) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        size: 48.0,
        color: Colors.red,
      ),
      title: Text(
        tileString,
        style: TextStyle(
          color: Colors.red[900],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //ตัวแสดงการแจ้งเตือนต่างๆ
  void myAlert(String titleString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitle(titleString),
          content: Text(messageString),
          actions: <Widget>[alerButton()],
        );
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
