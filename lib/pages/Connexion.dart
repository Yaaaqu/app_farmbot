import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea( //Evite que le texte soit sous la barre d'infos
          child: Text(
              'Connexion'
          )
      ),
    );
  }
}
