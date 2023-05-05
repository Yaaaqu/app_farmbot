import 'package:flutter/material.dart';

class Faire extends StatelessWidget {
  //const Faire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actions',
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontFamily: 'Dongle',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
      ),
    );
  }
}