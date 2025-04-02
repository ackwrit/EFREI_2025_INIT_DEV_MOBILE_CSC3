import 'package:cloud_firestore/cloud_firestore.dart';

class Mymessage {
  //attributs
  late String id;
  late DateTime time;
  late String destinataire;
  late String contenu;
  late String emeteur;

  //constructeur
  Mymessage(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    destinataire = data["DESTINATAIRE"];
    emeteur = data["EMETTEUR"];
    contenu = data["CONTENU"];
    Timestamp timestamp = data["TIME"];
    time = timestamp.toDate();
  }

  //méthode
}
