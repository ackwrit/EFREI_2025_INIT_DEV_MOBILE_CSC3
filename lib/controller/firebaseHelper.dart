import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efrei_application/controller/globale.dart';
import 'package:efrei_application/model/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebasHelper {
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudMessages = FirebaseFirestore.instance.collection("MESSAGES");
  final cloudConversations =
      FirebaseFirestore.instance.collection("CONSVERSATIONS");

  Future<MyUser> connexion(String email, String password) async {
    UserCredential credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    String uid = credential.user!.uid;
    return getUser(uid);
  }

  Future<MyUser> inscription(String email, String password) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = credential.user!.uid;
    Map<String, dynamic> data = {
      "EMAIL": email,
      "NOM": "",
      "BIRTHDAY": DateTime.now()
    };
    addUser(uid, data);

    return getUser(uid);
  }

  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot snap = await cloudUsers.doc(uid).get();
    return MyUser.bdd(snap);
  }

  addUser(String uid, Map<String, dynamic> data) {
    cloudUsers.doc(uid).set(data);
  }

  addMessage(String uid, Map<String, dynamic> data) {
    cloudMessages.doc(uid).set(data);
  }

  addConversation(String uid, Map<String, dynamic> data) {
    cloudConversations.doc(uid).set(data);
  }

  sendMessage(
      {required MyUser emeteur,
      required MyUser destinaire,
      required String contenu}) {
    DateTime time = DateTime.now();
    Map<String, dynamic> data = {
      "DESTINATAIRE": destinaire.id,
      "EMETTEUR": emeteur.id,
      "TIME": time,
      "CONTENU": contenu
    };
    String date = time.microsecondsSinceEpoch.toString();
    addMessage(getMessageref(emeteur.id, destinaire.id, date), data);
    addConversation(emeteur.id, getConversation(destinaire, contenu, time));
    addConversation(destinaire.id, getConversation(destinaire, contenu, time));
  }

  Map<String, dynamic> getConversation(
      MyUser destinatire, String contenu, DateTime date) {
    Map<String, dynamic> data = destinatire.toMap();
    data["EMETTEUR"] = moi.id;
    data["DESTINATAIRE"] = destinatire.id;
    data["TIME"] = date;
    data["CONTENU"] = contenu;
    return data;
  }

  String getMessageref(String emeteur, String dest, String date) {
    String resultat = "";
    List<String> liste = [emeteur, dest];
    liste.sort((a, b) => a.compareTo(b));
    for (var x in liste) {
      resultat += x + "+";
    }
    resultat = resultat + date;

    return resultat;
  }
}
