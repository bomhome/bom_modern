import 'package:flutter/material.dart';

class AddValue extends StatefulWidget {
  @override
  _AddValueState createState() => _AddValueState();
}

class _AddValueState extends State<AddValue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Add_value',
        style: TextStyle(fontSize: 40.0),
      ),
      alignment: Alignment.center,
    );
  }
}
