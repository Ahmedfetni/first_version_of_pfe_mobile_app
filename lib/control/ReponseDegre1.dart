import 'ReponseDegre2.dart';

class ReponseDegre1 {
  String nomUtilisateur;
  String text;
  int vote;
  DateTime date;
  List<ReponseDegre2> reponses;

  ReponseDegre1(
      {required this.nomUtilisateur,
      required this.text,
      this.vote = 0,
      required this.date,
      this.reponses = const []});

  String get getText => text;
  String get getNomUtilisateur => nomUtilisateur;
  int get getVote => vote;
  DateTime get getDate => date;
  List<ReponseDegre2> get getReponses => reponses;

  void ajouterUneReponse(ReponseDegre2 reponse) {
    reponses.add(reponse);
  }

  void supprimerUneReponse(ReponseDegre2 reponse) {
    reponses.remove(reponse);
  }

  void plusVote() {
    vote++;
  }

  void moinsVote() {
    vote--;
  }
}
