import 'package:flutter/material.dart';
import 'package:psir_app_farmbot/mqtt_commands.dart';
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late MqttCommands mqttCommands;
  @override
  void initState() {
    super.initState();
    mqttCommands = MqttCommands(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/faire');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 160.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Faire une action',
                style: TextStyle(
                  fontSize: 60.0,
                  letterSpacing: 2.0,
                  color: Colors.white,
                  fontFamily: 'Dongle',
                ),
              ),
            ),
            SizedBox(height: 20.0), //Espace de 20px
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/donnees');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 160.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Voir les données',
                style: TextStyle(
                  fontSize: 60.0,
                  letterSpacing: 2.0,
                  color: Colors.white,
                  fontFamily: 'Dongle',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {mqttCommands.soilHeight();},
        child: Text('Connect'),
        backgroundColor: Colors.red[600],
      ),

    );
  }
}
