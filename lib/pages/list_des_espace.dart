import 'package:flutter/material.dart';
import 'package:flutter_learning_about_themes_and_texts/widgets/connecter_ou_inscrire.dart';
import '../control/Espace.dart';
import '../widgets/cartes/carte_espace_constant.dart';
import '../bd_fausse.dart';

class ListDesEspaces extends StatelessWidget {
  bool utilisateurConnecter;
  ListDesEspaces({Key? key, required this.utilisateurConnecter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elements = BdFausse.espacesConstants();
    return Scaffold(
      appBar: AppBar(title: Text("Favories"),),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            ..._listDesEspaceConstant(elements),
          ],
        ),
      ),
    );
  }

  _listDesEspaceConstant(element) => [
        CarteEspaceConstant(espace: element[0], image: "math.jpg"),
        CarteEspaceConstant(espace: element[1], image: "bio.jpg"),
        CarteEspaceConstant(espace: element[2], image: "mec.jpg"),
      ];
}
