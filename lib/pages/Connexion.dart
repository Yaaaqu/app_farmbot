import 'package:flutter/material.dart';
import 'package:psir_app_farmbot/mqtt_commands.dart';

class Connexion extends StatefulWidget {
  final MqttCommands mqttCommands;
  const Connexion({Key? key, required this.mqttCommands}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool _obscureText = true;
  String mail = "";
  String mdp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Connexion',
              style: TextStyle(
                fontSize: 70.0,
                color: Colors.white,
                fontFamily: 'Dongle',
              ),
            ),
            SizedBox(height: 10.0), //Espace de 10px
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'E-mail',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),

                      ),
                    ),
                    onChanged: (champ1) => setState(() {
                      mail = champ1;
                    }),
                  ),
                  SizedBox(height: 10.0), //Espace de 10 pixels
                  Text(
                    'Mot de passe',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    obscureText: _obscureText,
                    onChanged: (champ2) => setState(() {
                      mdp = champ2;
                    }),
                  ),
                  SizedBox(height: 20.0), //Espace de 20 pixels
                ],
              ),
            ),
            SizedBox(height: 20.0), //Espace de 20 pixels
            ElevatedButton(
              onPressed: () {widget.mqttCommands.connect(mail, mdp, context);

                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.5, 70.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Valider',
                style: TextStyle(
                  fontSize: 40.0,
                  letterSpacing: 2.0,
                  color: Colors.grey[600],
                  fontFamily: 'Dongle',
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}