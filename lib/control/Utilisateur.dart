class Utilisateur {
  String nomUtilisateur;
  String email;
  String matricule;
  int nombreVote;
  int nombreReponse;
  int nombreQuestion;
  String statue;
  String sexe;

  Utilisateur({
    required this.nomUtilisateur,
    required this.email,
    required this.matricule,
    this.nombreVote = 0,
    this.nombreReponse = 0,
    this.nombreQuestion = 0,
    required this.statue,
    required this.sexe,
  });
}
