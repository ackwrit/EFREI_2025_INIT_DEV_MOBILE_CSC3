import 'package:efrei_application/controller/firebaseHelper.dart';
import 'package:efrei_application/controller/globale.dart';
import 'package:efrei_application/dashboard.dart';
import 'package:efrei_application/my_animation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variables
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  //méthode
  errorShow() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Text("Erreur"),
            content: Text("Erreur lors de la saisie du mail/password"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            MyAnimation(
              child: Container(
                height: 300,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/piece.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: mail,
              decoration: InputDecoration(
                  hintText: "Entrer votre adresse mail",
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  hintText: "Entrer votre mot de passe",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebasHelper()
                      .connexion(mail.text, password.text)
                      .then((value) {
                    setState(() {
                      moi = value;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyDashBoard()));
                    });
                  }).catchError((onError) {
                    errorShow();
                  });
                },
                child: Text("Connexion")),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  FirebasHelper()
                      .inscription(mail.text, password.text)
                      .then((value) {
                    setState(() {
                      moi = value;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyDashBoard()));
                    });
                  });
                },
                child: Text("Inscription")),
          ]),
        ));
  }
}
