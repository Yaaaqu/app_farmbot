// Fichier destiné à être importé dans un fichier tierce pour se connecter
// en mqtt à un farmbot, créée dans le cadre d'un projet d'initiation à la
// recherche scientifique.

// import necessaire pour établir une connection MQTT
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// ne pas oublier de faire un 'flutter pub add mqtt_client' dans le terminal

// Création de la classe principale
class MqttCommands {
  late MqttServerClient client;
  late BuildContext context;
  String status = '';
  String username = '';

// Fonction pour récuperer la clé API du farmbot
// il suffit de mettre en entrer le mail et le mot de passe
// la fonction retournera le nom du farmbot, son adresse MQTT et son mot de passe
// l'url où la requete est faite est hardcoded car n'est pas sensé changer
  Future<Map<String, dynamic>> getToken(String email, String password) async {
    final url = Uri.parse('https://my.farm.bot/api/tokens');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'user': {'email': email, 'password': password}});
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode != 200) {
      status="Mauvais mot de passe ?";
      showSnackbar();
      throw Exception("Impossible d'avoir le token");
    }
    final decoded = json.decode(response.body);
    final token = decoded['token'];
    return {
      'bot': token['unencoded']['bot'],
      'mqtt': token['unencoded']['mqtt'],
      'encoded': token['encoded'],
    };
  }
// fonction de connection au server mqtt
// il faut réunir les informations suivantes:
// - le port de connection
// - les topics ciblé dont celui qui revoit les mqtt rpc ack
  void connect(String email, String pass, BuildContext context1) async {
    context=context1;
    // on commence par faire une requete REST API pour récuperer le token
    final token = await getToken(email,pass);
    username = token['bot']; // on set la variable global
    final String mqtt = token['mqtt'];  // on trie l'url MQTT
    final String password = token['encoded']; // on trie le mot de passe
    client = MqttServerClient(mqtt, ''); // on réutilise l'url du token
    client.logging(on: false);  // utile pour avoir plus de logins
    client.port = 8883;         // port à spécifier (1883=mqtt, 8883=mqtts)
    client.secure = true;        //active le mode sécurisé
    client.onConnected = () { // boucle triggered lors de la confirmation de connexion
      print('Connecté');
      status = 'Connecté';
      showSnackbar();
      client.subscribe('bot/$username/from_device', MqttQos.atLeastOnce);
    };
    client.onDisconnected = () {  // boucle triggered lors de la déconnexion
      print('Déconnecté');
      status = 'Déconnecté';
      showSnackbar();
    };

    // connMess est le message de connection
    // on y spécifie tout ce qu'il faut pour s'identifier
    // et se connecter au server mqtt
    // on réutilise les infos du token pour l'authentification
    final connMess = MqttConnectMessage()
        .authenticateAs(username, password)
        .startClean()
        .withWillRetain()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;
    try {
      await client.connect();
      Navigator.pushNamed(context, '/menu');
    } catch (e) { // pour faire de la gestion d'erreur
      print(e.toString()); // justement pour afficher l'erreur
      client.disconnect();
    }
  }
  void showSnackbar() {
    if (status == 'Déconnecté') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(status),
          action: SnackBarAction(
            label: 'Reconnecter',
            onPressed: () {Navigator.pushNamed(context, '/connexion');},
          ),
        ),
      );}
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(status),
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

// Rédaction type d'une fonction pour envoyer des commandes:
//  void sendHomeRequest() {
//    final rpcRequest = """{
//      "kind": "rpc_request",  // ce field est obligatoire pour le farmbot
//      "args": { "label": "find_home by phone app" },    //le label est personnalisable
//      "body": [{              // le body contient la fonction celeryscript
//  "kind": "find_home",        // pour le farmbot
//  "args": {
//    "axis": "all",
//    "speed": 100
//  }
//}
//      ]
//    }""";
//    final message = MqttClientPayloadBuilder()  //mise en forme du message
//        .addString(rpcRequest)                  // obligatoirement un format String
//        .payload;
//    client.publishMessage(                      // spécifie le topic à publier
//        'bot/-----------------------/from_clients', MqttQos.atLeastOnce, message!);
//  }

// simply ask the bot to find its home, might take a long time depending on
// the position where you are starting to search home
  void sendHomeRequest() {
    final rpcRequest = """{
      "kind": "rpc_request",
      "args": { "label": "find_home by phone app" },
      "body": [{
  "kind": "find_home",
  "args": {
    "axis": "all",
    "speed": 100
  }
}
      ]
    }""";
    final message = MqttClientPayloadBuilder()
        .addString(rpcRequest)
        .payload;
    client.publishMessage(
        'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
  }

// it will take a picture at the current position, recovering picture is in progress
  void takePhotoRequest() {
    final rpcRequest = """{
      "kind": "rpc_request",
      "args": { "label": "take_photo by phone app" },
      "body": [{
  "kind": "take_photo",
  "args": {}
}
      ]
    }""";
    final message = MqttClientPayloadBuilder()
        .addString(rpcRequest)
        .payload;
    client.publishMessage(
        'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
  }



// simply moves the farmbot to the xyz given coordinates
  void sendMoveRequest(int x, int y, int z) {
    final rpcRequest = """{
      "kind": "rpc_request",
      "args": { "label": "random move by phone app" },
      "body": [{
  "kind": "move_absolute",
  "args": {
    "speed": 100,
    "location": {
      "kind": "coordinate",
      "args": {
        "x": $x,
        "y": $y,
        "z": $z
      }
    },
    "offset": {
      "kind": "coordinate",
      "args": {
        "x": 0,
        "y": 0,
        "z": 0
      }
    }
  }
}
      ]
    }""";
    final message = MqttClientPayloadBuilder()
        .addString(rpcRequest)
        .payload;
    client.publishMessage(
        'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
  }

// it will dispense some water for 2 seconds at the position of the farmbot
  void dispenseWater() {
    final rpcRequest = """{
      "kind": "rpc_request",
      "args": { "label": "Dispense Water by phone app" },
      "body": [{
  "kind": "write_pin",
  "args": {
    "pin_mode": 0,
    "pin_value": 1,
    "pin_number": {
      "kind": "named_pin",
      "args": {
        "pin_id": 32859,
        "pin_type": "Peripheral"
      }
    }
  },
  "comment": "Turn on water"
},
{
  "kind": "wait",
  "args": {
    "milliseconds": 2000
  },
  "comment": "Wait 2 seconds"
},{
  "kind": "write_pin",
  "args": {
    "pin_mode": 0,
    "pin_value": 0,
    "pin_number": {
      "kind": "named_pin",
      "args": {
        "pin_id": 32859,
        "pin_type": "Peripheral"
      }
    }
  },
  "comment": "Turn off water"
}
      ]
    }""";
    final message = MqttClientPayloadBuilder()
        .addString(rpcRequest)
        .payload;
    client.publishMessage(
        'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
  }

// waters all the plants defined in the garden
  void waterAll() {
    final rpcRequest = """{
      "kind": "rpc_request",
      "args": { "label": "Water all by phone app" },
      "body": [{
  "kind": "execute",
  "args": {
    "sequence_id": 96172
  },
  "body": [
    {
      "kind": "parameter_application",
      "args": {
        "label": "parent",
        "data_value": {
          "kind": "point_group",
          "args": {
            "point_group_id": 48895
          }
        }
      }
    }
  ],
  "comment": "Water all plants"
}
      ]
    }""";
    final message = MqttClientPayloadBuilder()
        .addString(rpcRequest)
        .payload;
    client.publishMessage(
        'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
  }

// it will mow all the improper weeds
  void mowAllWeeds() {
    final rpcRequest = """{
      "kind": "rpc_request",
      "args": { "label": "Mow All Weeds by phone app" },
      "body": [{
  "kind": "lua",
  "args": {
    "lua": "rotary_tool_pin = 2 -- 3 for REV\nmax_load = tonumber(env(\"rotary_tool_max_load\")) or 90\nrotary_tool_height = tonumber(env(\"rotary_tool_height\")) or 80\nmax_attempts = tonumber(env(\"rotary_tool_max_attempts\")) or 3\nweeds = {}\ncount = 0\n\nfunction job(status, percent)\n    set_job_progress(\"Mowing weed at \" .. coords, {\n        status = status,\n        percent = percent,\n        time = job_time\n    })\nend\n\npjob_time = os.time() * 1000\nfunction pjob(status, percent)\n    set_job_progress(\"Mowing \" .. #weeds .. \" weeds\", {\n        status = status,\n        percent = percent,\n        time = pjob_time\n    })\nend\n\nwatcher = function(data)\n    if (data.value > max_load) and (env(\"load\") ~= \"stalled\") then\n        env(\"load\", \"stalled\")\n        soft_stop()\n        off(rotary_tool_pin)\n        toast(\"Rotary tool max load exceeded (load = \" .. data.value .. \")\", \"warn\")\n    end\nend\n\nfunction attempt_weeding()\n    attempts = attempts + 1\n    env(\"load\", \"nominal\")\n    job(\"Moving to weed\", 10)\n    move{\n        x = weed.x - (weed.radius + 50),\n        y = weed.y,\n        z = weed.z + rotary_tool_height + 20,\n        safe_z = true\n    }\n\n    on(rotary_tool_pin)\n\n    if env(\"load\") == \"stalled\" then\n        wait(1500)\n        return\n    end\n    job(\"Descending\", 40)\n    move{\n        z = weed.z + rotary_tool_height,\n        speed = 25\n    }\n\n    if env(\"load\") == \"stalled\" then\n        wait(1500)\n        return\n    end\n    job(\"Mowing\", 50)\n    move{\n        x = weed.x + (weed.radius + 50),\n        speed = 25\n    }\n\n    if env(\"load\") == \"stalled\" then\n        wait(1500)\n        return\n    end\n    job(\"Ascending\", 90)\n    move{\n        z = weed.z + rotary_tool_height + 20,\n        speed = 25\n    }\n\n    if env(\"load\") == \"stalled\" then\n        wait(1500)\n        return\n    end\n    off(rotary_tool_pin)\n    success = true\nend\n\nif not verify_tool() then\n    return\nend\n\npoints = api({\n    method = \"GET\",\n    url = \"/api/points\"\n})\n\nfor k, v in pairs(points) do\n    if v.pointer_type == \"Weed\" then\n        table.insert(weeds, {x = v.x, y = v.y, z = soil_height(v.x, v.y), radius = v.radius})\n    end\nend\n\nwatch_pin(60, watcher)\n\nfor k, v in pairs(weeds) do\n    weed = v\n    count = count + 1\n    job_time = os.time() * 1000\n    pjob(\"Mowing weed \" .. count .. \" of \" .. #weeds, count / (#weeds + 1) * 100)\n    coords = \"(\" .. weed.x .. \", \" .. weed.y .. \", \" .. weed.z .. \")\"\n    attempts = 0\n    success = false\n    while (attempts < max_attempts) and (success == false) do\n        attempt_weeding()\n    end\n    if env(\"load\") == \"stalled\" then\n        toast(\"Mowing weed at \" .. coords .. \" failed after \" .. attempts .. \" attempt(s); proceeding...\", \"warn\")\n    end\n    job(\"Complete\", 100)\nend\npjob(\"Complete\", 100)\ntoast(\"Mowing complete\", \"success\")"
  }
}
      ]
    }""";
    final message = MqttClientPayloadBuilder()
        .addString(rpcRequest)
        .payload;
    client.publishMessage(
        'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
  }

// determine soil Height, but it doesnt return it yet, work in progress
  void soilHeight() {
    final rpcRequest = """{
      "kind": "rpc_request",
      "args": { "label": "Soil_Height" },
      "body": [{
  "kind": "sequence",
  "args": {},
  "body": [
    {
      "kind": "read_pin",
      "args": {
        "pin_mode": 0,
        "pin_number": 5956
      }
    },
    {
      "kind": "assertion",
      "args": {
        "lhs": {
          "kind": "named_pin",
          "args": {
            "pin_type": "Sensor",
            "pin_id": 5956
          }
        },
        "op": "is_found",
        "rhs": true
      }
    },
    {
      "kind": "read_pin",
      "args": {
        "pin_mode": 0,
        "pin_number": 5956
      }
    }
  ]
}
 ]
    }""";
    final message = MqttClientPayloadBuilder()
        .addString(rpcRequest)
        .payload;
    client.publishMessage(
        'bot/$username/from_clients', MqttQos.atLeastOnce, message!);
  }

}
