import 'Tag.dart';
import 'ReponseDegre1.dart';

class Question {
  String titre, corp, nomUtilisateur;
  int vote;
  DateTime date;
  List<Tag> listDesTags;
  List<ReponseDegre1> reponses;

  Question({
    required this.titre,
    required this.corp,
    required this.nomUtilisateur,
    this.vote = 0,
    required this.date,
    this.listDesTags = const [],
    this.reponses = const [],
  });

  String get getTitre => titre;
  String get getCorp => corp;
  String get getNomUtilisateur => nomUtilisateur;
  int get getVote => vote;
  DateTime get getDate => date;
  List<Tag> get getTags => listDesTags;
  List<ReponseDegre1> get getReponses => reponses;

  void addTag(String nomDuTag) {
    Tag tag = Tag(nom: nomDuTag);
    listDesTags.add(tag);
  }

  void supprimerTag(String nomDuTag) {
    listDesTags.retainWhere((element) => element.getNom == nomDuTag);
  }

  void ajouterUneReponse(ReponseDegre1 reponse) {
    reponses.add(reponse);
  }

  void supprimerUneReponse(ReponseDegre1 reponse) {
    reponses.remove(reponse);
  }
}
