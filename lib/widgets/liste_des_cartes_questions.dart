import 'package:flutter/material.dart';
import '../control/Question.dart';
import 'cartes/carte_question.dart';
import '../bd_fausse.dart';

class ListDesCartesQuestions extends StatelessWidget {
  ListDesCartesQuestions({Key? key}) : super(key: key);
  final li = BdFausse.genererQuestion();
  @override
  Widget build(BuildContext context) {
    if (li.isNotEmpty) {
      return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          scrollDirection: Axis.vertical,
          itemCount: li.length,
          itemBuilder: (BuildContext context, int index) {
            return CarteQuestion(
              question: li[index],
            );
          });
    } else {
      return const Center(
        child: Text("Accune question pour le momment"),
      );
    }
  }
}
