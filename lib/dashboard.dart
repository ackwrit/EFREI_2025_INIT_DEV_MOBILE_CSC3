import 'package:efrei_application/view/AllProfil.dart';
import 'package:efrei_application/view/MyProfil.dart';
import 'package:flutter/material.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  //variables
  int indexCurrent = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deuxième application"),
      ),
      body: selected(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: (value) {
            setState(() {
              indexCurrent = value;
            });
          },
          currentIndex: indexCurrent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Moi"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: "Messagerie"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Paramètres"),
          ]),
    );
  }

  Widget selected() {
    switch (indexCurrent) {
      case 0:
        return Myprofil();
      case 1:
        return AllProfil();
      case 2:
        return Text("paramètres");
      default:
        return Text("Défault");
    }
  }
}
