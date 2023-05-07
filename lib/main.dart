import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:psir_app_farmbot/pages/Connexion.dart';
import 'package:psir_app_farmbot/pages/Donnees.dart';
import 'package:psir_app_farmbot/pages/LoadScreen.dart';
import 'package:psir_app_farmbot/pages/Menu.dart';
import 'package:psir_app_farmbot/pages/Faire.dart';



/*void main() {
  runApp(MaterialApp(
    home: Home(),
  ));*/
void main() => runApp(MaterialApp(
  initialRoute: '/connexion',
  routes: {
    '/': (context) => Loadscreen(),
    '/connexion': (context) => Connexion(),
    '/menu': (context) => Menu(),
    '/donnees': (context) => Donnees(),
    '/faire': (context) => Faire(),
  },
));

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

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
