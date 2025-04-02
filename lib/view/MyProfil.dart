import 'package:efrei_application/controller/globale.dart';
import 'package:flutter/material.dart';

class Myprofil extends StatefulWidget {
  const Myprofil({super.key});

  @override
  State<Myprofil> createState() => _MyprofilState();
}

class _MyprofilState extends State<Myprofil> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(moi.avatar),
          ),
          SizedBox(
            height: 10,
          ),
          Text(moi.nom),
          SizedBox(
            height: 10,
          ),
          Text(moi.email),
        ],
      ),
    );
  }
}
