import 'package:flutter/material.dart';

class HomeService extends StatefulWidget {
  @override
  _HomeServiceState createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 40.0),
      ),
    );
  }
}
