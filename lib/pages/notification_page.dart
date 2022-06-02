import 'package:flutter/material.dart';
import '../widgets/cartes/carte_notification.dart';
import '../widgets/connecter_ou_inscrire.dart';

class PageNotification extends StatelessWidget {
  final bool utilisateurConnecter;
  const PageNotification({Key? key, required this.utilisateurConnecter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue.shade500,
            title: const Text("Les notfications",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white))),
        body: utilisateurConnecter
            ? ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CarteNotification(),
                  CarteNotification(),
                  CarteNotification(),
                  CarteNotification(),
                  CarteNotification(),
                ],
              )
            : ConnecterOuInscrire());
  }
}
