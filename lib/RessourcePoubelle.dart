import 'package:flutter/material.dart';


/*void main() {
  runApp(MaterialApp(
    home: Home(),
  ));*/
void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Données'),
        centerTitle: true, //Centre le titre de l'app bar
        backgroundColor: Color.fromARGB(255, 64, 64, 64),
      ),
      body: Center(
        child: Text(
          'Farmbot',
          style: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey,
            fontFamily: 'Dongle',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
children: <Widget>[
Container(
padding: EdgeInsets.all(20.0),
color: Colors.teal,
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