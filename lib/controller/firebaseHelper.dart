import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efrei_application/model/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebasHelper {
  final auth = FirebaseAuth.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");

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
}
