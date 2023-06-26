import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class GlobalFonction {
  //fonction to check connection whith the api
  static int? connectionChecked;
  static bool connectionChecke = false;
  static Future<bool> connectionCheck() async {
    try {
      const url = 'http://192.168.43.173:3000/';
      final uri = Uri.parse(url); // Convertir la chaîne en objet Uri
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // La requête s'est effectuée avec succès
        // Effectuer le traitement des données de la réponse
        return true;
      } else {
        // La requête a échoué
        //print('Erreur de requête: ${response.statusCode}
        GlobalFonction.connectionChecked = 0;
        return false;
      }
    } catch (e) {
      // Une exception s'est produite lors de la requête
      print('Erreur de connexion: $e');
      return false;
    }
  }

//fonction to get path of file
  static Future<String> getLocationFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//fonction to save data
  static void saveData(String data) async {
    final path = await getLocationFilePath();
    final file = File('$path/data.txt');
    await file.writeAsString(data);
  }

  //fonction to get data from file
  static Future<String> getData() async {
    try {
      final path = await getLocationFilePath();
      final file = File('$path/data.txt');
      return await file.readAsString();
    } catch (e) {
      return 'null';
    }
  }
// fonction to update data
static void modifyData(String newData) async
{
  final path = await getLocationFilePath();
  final file = File('$path/data.txt');
  //String existingData = await file.readAsString();
  await file.writeAsString(newData);
}
  // static final connectionCheck2 = Provider((ref) async {
  //   return connectionChecked;
  // });
  // static final connectionCheckedProvider = Provider((ref) => connectionChecked);
}
