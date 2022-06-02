class ReponseDegre2 {
  String text;
  int vote;
  DateTime date;
  String nomUtilisateur;

  ReponseDegre2({
    required this.nomUtilisateur,
    required this.text,
    this.vote = 0,
    required this.date,
  });

  String get getText => text;
  String get getNomUtilisateur => nomUtilisateur;
  int get getVote => vote;
  DateTime get getDate => date;

  void plusVote() {
    vote++;
  }

  void moinsVote() {
    vote--;
  }
}
