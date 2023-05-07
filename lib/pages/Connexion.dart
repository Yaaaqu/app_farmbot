import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
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
                    onSubmitted: (champ1) => setState(() {
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
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onSubmitted: (champ2) => setState(() {
                      mdp = champ2;
                    }),
                  ),
                  SizedBox(height: 20.0), //Espace de 20 pixels
                ],
              ),
            ),
            SizedBox(height: 20.0), //Espace de 20 pixels
            ElevatedButton(
              onPressed: () {
                //TODO Requette
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
