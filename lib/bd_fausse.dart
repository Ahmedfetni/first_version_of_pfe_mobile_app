import 'control/ReponseDegre2.dart';
import 'control/ReponseDegre1.dart';
import 'control/Tag.dart';
import 'control/Question.dart';
import 'control/Utilisateur.dart';
import 'package:random_date/random_date.dart';
import 'control/Espace.dart';

class BdFausse {
  static List<ReponseDegre2> _genererReponsesDegre2() {
    List<ReponseDegre2> reponses = [];
    for (int i = 0; i < 3; i++) {
      reponses.add(
        ReponseDegre2(
          nomUtilisateur: "Mohammed",
          text: "est ce que t'as deja essayer ca",
          date: RandomDate.withStartYear(2022).random(),
        ),
      );
    }
    return reponses;
  }

  static List<ReponseDegre1> _genererReponsesDegre1() {
    List<ReponseDegre1> reponses = [];
    for (int i = 0; i < 25; i++) {
      reponses.add(
        ReponseDegre1(
          nomUtilisateur: "Mohammed",
          text: "est ce que t'as deja essayer ca",
          date: RandomDate.withStartYear(2022).random(),
          reponses: _genererReponsesDegre2(),
        ),
      );
    }
    return reponses;
  }

  static List<Tag> _genererTags() {
    List<Tag> tags = [];
    for (var i = 0; i < 1; i++) {
      tags.add(Tag(nom: "Algo"));
    }
    return tags;
  }

  static List<Question> genererQuestion() {
    List<Question> questions = [];
    for (int i = 0; i < 12; i++) {
      questions.add(
        Question(
            nomUtilisateur: "Mohammed",
            titre: "Comment trier une pile par order croissant?",
            corp:
                "J' ai vu  un exercice ou je dois trier une pile par ordere croissant sachant que je ne peut pas changer la structure des donnees et la pile est deja remplit Donc je me demande si y a quelq'un qui peut m'aider a trouver une solution optimal",
            reponses: _genererReponsesDegre1(),
            listDesTags: _genererTags(),
            date: RandomDate.withStartYear(2022).random()),
      );
      questions[i].addTag("MI");
      questions[i].addTag("L2");
      questions[i].addTag("S3");
      questions[i].addTag("Informatique");
    }
    questions.add(Question(
        titre: "un titre tres long long  long long  long long long long ",
        corp:
            "J' ai vu  un exercice ou je dois trier une pile par ordere croissant sachant que je ne peut pas changer la structure des donnees et la pile est deja remplit Donc je me demande si y a quelq'un qui peut m'aider a trouver une solution optimalJ' ai vu  un exercice ou je dois trier une pile par ordere croissant sachant que je ne peut pas changer la structure des donnees et la pile est deja remplit Donc je me demande si y a quelq'un qui peut m'aider a trouver une solution optimalJ' ai vu  un exercice ou je dois trier une pile par ordere croissant sachant que je ne peut pas changer la structure des donnees et la pile est deja remplit Donc je me demande si y a quelq'un qui peut m'aider a trouver une solution optimal",
        nomUtilisateur: "Ahmed",
        date: DateTime.now()));
    return questions;
  }

  static List<Espace> espacesConstants() => [
        Espace(nom: "Faculite Des Mathematiques"),
        Espace(nom: "Faculite Des Sciences biologiques"),
        Espace(nom: "Faculté de Génie Mécanique et Génie des Procédés ")
      ];
}
