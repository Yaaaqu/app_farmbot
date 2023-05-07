import 'package:flutter/material.dart';

class Deplacement extends StatefulWidget {
  const Deplacement({Key? key}) : super(key: key);

  @override
  State<Deplacement> createState() => _DeplacementState();
}

class _DeplacementState extends State<Deplacement> {
  int _x = 0, _y = 0, _z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aller à...',
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
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Veuillez rentrer les coordonnées',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60.0,
                height: 0.7,
                color: Colors.white,
                fontFamily: 'Dongle',
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Valeur de X',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                    fontFamily: 'Dongle',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onSaved: (champX) {
                    _x = int.parse(champX!); /////////////////////////////A vérifier
                  },
                ),
                Text(
                  'Valeur de Y',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                    fontFamily: 'Dongle',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onSaved: (champY) {
                    _y = int.parse(champY!); /////////////////////////////A vérifier
                  },
                ),
              ],
            ),
            Text(
              'Valeur de Z',
              style: TextStyle(
                fontSize: 45.0,
                color: Colors.white,
                fontFamily: 'Dongle',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onSaved: (champZ) {
                _z = int.parse(champZ!); /////////////////////////////A vérifier
              },
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