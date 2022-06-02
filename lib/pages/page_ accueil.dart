import 'package:flutter/material.dart';
import 'ajouter_une_question.dart';
import '../widgets/liste_des_cartes_questions.dart';
import 'navigation.dart';

class pageAccueil extends StatelessWidget {
  bool utilisateurConnecter;
  pageAccueil({Key? key, required this.utilisateurConnecter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(utilisateurConnecter: this.utilisateurConnecter),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Page D'Accueil",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          ListDesCartesQuestions(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 12, bottom: 12),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      scrollable: true,
                      content: AjouterUneQuestion(),
                    ),
                    barrierDismissible: true,
                  );
                },
                child: const Icon(
                  Icons.question_mark_rounded,
                  color: Colors.white,
                ),
                elevation: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
