import 'package:http/http.dart' as http;
class GlobalFonction
{
  //fonction to check connection whith the api
  static int? connectionChecked;
  static  connectionCheck() async {
    try {
      const url = 'http://192.168.43.173:3000/';
      final uri = Uri.parse(url); // Convertir la chaîne en objet Uri
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // La requête s'est effectuée avec succès
        // Effectuer le traitement des données de la réponse
        GlobalFonction.connectionChecked = 1;
        print('1');
      }
      else {
        // La requête a échoué
        //print('Erreur de requête: ${response.statusCode}
        GlobalFonction.connectionChecked = 0;
        print('0');
      }
    } catch (e) {
      // Une exception s'est produite lors de la requête
      print('Erreur de connexion: $e');
    }
  }
}