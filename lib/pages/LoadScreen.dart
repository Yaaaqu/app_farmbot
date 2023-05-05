import 'package:flutter/material.dart';

class Loadscreen extends StatelessWidget {
  //const Loadscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Text(
          'Farmbot',
          style: TextStyle(
            fontSize: 70.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[200],
            fontFamily: 'Dongle',
          ),
        ),
      ),
    );
  }
}