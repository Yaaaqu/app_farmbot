import 'package:flutter/material.dart';

import '../mqtt_commands.dart';

class Donnees extends StatefulWidget {
  final MqttCommands mqttCommands;
  const Donnees({Key? key, required this.mqttCommands}) : super(key: key);

  @override
  State<Donnees> createState() => _DonneesState();
}
class _DonneesState extends State<Donnees> {
  //const Donnees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Données',
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