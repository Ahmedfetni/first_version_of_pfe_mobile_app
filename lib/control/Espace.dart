import 'Question.dart';
import 'Utilisateur.dart';

class Espace {
  String nom;
  List<Question> questions;
  List<Utilisateur> utilisateurs;

  Espace(
      {required this.nom,
      this.questions = const [],
      this.utilisateurs = const []});

  String get getNom => nom;
  List<Question> get getQuestions => questions;
  List<Utilisateur> get getUtilisateur => utilisateurs;

  void ajouterUneQuestion(Question question) => questions.add(question);
  void supprimerUneQuestion(Question question) => questions.remove(question);

  void ajouterUtilisateur(Utilisateur utilisateur) =>
      utilisateurs.add(utilisateur);
  void supprimerUtilisateur(Utilisateur utilisateur) =>
      utilisateurs.remove(utilisateur);
}
