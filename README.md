# Application Farmbot

Ce projet a été réalisé dans le cadre du PSIR (Projet Scientifique d'Initiation à la Recherche) à l'ESAIP, avec pour problématique : "comment optimiser le rendement agricole à l'aide de solutions intelligentes ?"

# Contenu du Repository GitHub

Ce repository GitHub contient une application mobile utilisant Flutter et Dart pour interagir avec un Farmbot. 
Voici les principales composantes :

## Front-end

L'application front-end en Flutter comprend les éléments suivants :
* Une page de connexion
* Deux sous-menus : "Faire une action" et "Voir les données"
* Plusieurs boutons pour effectuer différentes actions

## Back-end

Le back-end en Dart est responsable de la communication avec le Farmbot. Voici ses fonctionnalités principales :
* Utilisation d'une API REST pour récupérer le token API d'un Farmbot
* Utilisation du token API reçu en HTTPS pour établir une connexion MQTTS
* Présence de plusieurs commandes disponibles, telles que connecter, déplacer, prendre une photo, arroser, etc.

Exemple de rédaction pour une commande :
```dart
void sendHomeRequest() {
  final rpcRequest = """{
    "kind": "rpc_request",  // Ce champ est obligatoire pour le Farmbot
    "args": {
      "label": "find_home by phone app"  // Le label est personnalisable
    },
    "body": [  // Le corps contient la fonction celeryscript pour le Farmbot
      {
        "kind": "find_home",
        "args": {
          "axis": "all",
          "speed": 100
        }
      }
    ]
  }""";

  final message = MqttClientPayloadBuilder()  // Mise en forme du message
      .addString(rpcRequest)                  // Doit être au format String
      .payload;

  client.publishMessage(                      // Spécifie le topic à publier
      'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
}
```
Veuillez vous référer à la documentation de Farmbot pour la rédaction des scripts celery à l'adresse suivante : https://developer.farm.bot/v15/docs/celery-script.html. Pour plus d'informations sur les topics MQTT, consultez https://developer.farm.bot/v15/docs/message-broker/sending-commands#step-3-subscribing-to-topics.

Cette documentation vous aidera à comprendre la syntaxe des scripts celery et à gérer les topics MQTT nécessaires pour communiquer avec le Farmbot.
