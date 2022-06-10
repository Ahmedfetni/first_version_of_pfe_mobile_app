import 'package:flutter/material.dart';
import 'package:flutter_learning_about_themes_and_texts/pages/list_des_espace.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'pages/notification_page.dart';
import 'pages/page_des_favories.dart';
import 'pages/page_ accueil.dart';
import 'pages/connexion.dart';
import 'pages/cree_compte.dart';
import 'widgets/cartes/carte_espace_constant.dart';
import 'control/Espace.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool utilisateurConnecter = true;
  int indexDesEcrant = 0;
  bool ajouterTagEstAutoFocus = false;
  @override
  Widget build(BuildContext context) {
    final listDesEcrant = [
      pageAccueil(utilisateurConnecter: utilisateurConnecter),
      ListDesEspaces(utilisateurConnecter: utilisateurConnecter),
      PageDesFavories(utilisateurConnecter: utilisateurConnecter),
      PageNotification(utilisateurConnecter: utilisateurConnecter),
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ask USTHB',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Scaffold(
          body: listDesEcrant[
              indexDesEcrant], //Center(child: CarteEspaceGenieMec()),
          bottomNavigationBar: CurvedNavigationBar(
            onTap: ((index) => setState(() {
                  indexDesEcrant = index;
                })),
            animationDuration: const Duration(milliseconds: 300),
            buttonBackgroundColor: Colors.lightBlue,
            backgroundColor: Colors.white,
            color: Colors.lightBlue,
            items: const [
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.group_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.bookmark_rounded,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.notifications_rounded,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        )
        // Connexion(), //pageAccueil(), //const MyHomePage(title: 'Page d\'acceuil'),
        );
  }
}
