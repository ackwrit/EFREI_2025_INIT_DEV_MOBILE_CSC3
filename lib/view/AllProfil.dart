import 'package:efrei_application/controller/firebaseHelper.dart';
import 'package:efrei_application/controller/globale.dart';
import 'package:efrei_application/model/myUser.dart';
import 'package:flutter/material.dart';

class AllProfil extends StatefulWidget {
  const AllProfil({super.key});

  @override
  State<AllProfil> createState() => _AllProfilState();
}

class _AllProfilState extends State<AllProfil> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebasHelper().cloudUsers.snapshots(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            if (snap.data == null) {
              return Center(
                child: Text("Il n'y a pas d'utilisateur"),
              );
            } else {
              List documents = snap.data!.docs;
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (contex, index) {
                    MyUser user = MyUser.bdd(documents[index]);
                    if (moi.id == user.id) {
                      return SizedBox();
                    } else {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text(user.email),
                          subtitle: Text(user.nom),
                        ),
                      );
                    }
                  });
            }
          }
        });
  }
}
