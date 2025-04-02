import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efrei_application/controller/globale.dart';

class MyUser {
  late String id;
  late String nom;
  late String email;
  String avatar = imageUrl;
  DateTime? birthday;

  MyUser() {
    id = "";
    nom = "";
    email = "";
    birthday = DateTime.now();
  }

  MyUser.bdd(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    nom = map["NOM"];
    email = map["EMAIL"];
    Timestamp? provisoire = map["BIRTHDAY"];
    if (provisoire != null) {
      birthday = provisoire.toDate();
    } else {
      birthday = DateTime.now();
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data;
    return data = {"NOM": nom, "EMAIL": email, "BIRTHDAY": birthday};
  }
}
