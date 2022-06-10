import 'package:flutter/material.dart';
import 'ajouter_une_question.dart';
import '../widgets/liste_des_cartes_questions.dart';
import 'navigation.dart';
import '../widgets/recherch_par_tag.dart';

class pageAccueil extends StatelessWidget {
  bool utilisateurConnecter;
  pageAccueil({Key? key, required this.utilisateurConnecter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(utilisateurConnecter: utilisateurConnecter),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Page D'Accueil",
          style: TextStyle(color: Colors.white),
        ),
        /* Le boutton de recherche  */
        actions: [
          TextButton.icon(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: RecherchParTag(),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
              label: const Text("")),
        ],
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
                      content: const AjouterUneQuestion(),
                    ),
                    barrierDismissible: true,
                  );
                },
                elevation: 5,
                child: const Icon(
                  Icons.question_mark_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
