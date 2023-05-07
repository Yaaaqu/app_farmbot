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
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //TODO redirection
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 160.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Arroser tout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      height: 1.0,
                      //letterSpacing: 2.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //TODO redirection
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 160.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Arroser emplacement actuel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 33.0,
                      height: 1.0,
                      //letterSpacing: 2.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //TODO redirection
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 160.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Retour maison',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      height: 1.0,
                      //letterSpacing: 2.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/deplacement');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 160.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Aller à...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      height: 1.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //TODO redirection
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 160.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Arracher mauvaises herbes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      height: 1.0,
                      //letterSpacing: 2.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //TODO redirection
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 160.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      height: 1.0,
                      //letterSpacing: 2.0,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}