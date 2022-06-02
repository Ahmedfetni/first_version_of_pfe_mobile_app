import 'package:flutter/material.dart';
import 'package:flutter_learning_about_themes_and_texts/widgets/connecter_ou_inscrire.dart';
import '../bd_fausse.dart';
import '../control/Question.dart';
import '../widgets/liste_des_cartes_questions.dart';

class PageDesFavories extends StatefulWidget {
  bool utilisateurConnecter;
  PageDesFavories({Key? key, required this.utilisateurConnecter})
      : super(key: key);

  @override
  State<PageDesFavories> createState() => _PageDesFavoriesState();
}

class _PageDesFavoriesState extends State<PageDesFavories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.utilisateurConnecter
          ? ListDesCartesQuestions()
          : Center(
              child: ConnecterOuInscrire(),
            ),
    );
  }
}
