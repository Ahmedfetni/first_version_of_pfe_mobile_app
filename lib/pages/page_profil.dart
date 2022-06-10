import 'package:flutter/material.dart';
import 'package:flutter_learning_about_themes_and_texts/widgets/changer_mot_de_passe.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Mon profil",
            style: TextStyle(color: Colors.white),
          ),
          leading: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              label: const Text(""))),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.blueAccent),
                  shape: BoxShape.circle),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                minRadius: MediaQuery.of(context).size.width * 0.2,
                backgroundColor: Colors.yellowAccent,
                foregroundColor: Colors.lightBlue,
                // ignore: prefer_const_constructors
                child: Text(
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  "MO",
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                // ignore: prefer_const_constructors
                child: Text(
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  "Mohammed Amin",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("+13"),
                      Text("votes"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("7"),
                      Text("Reponses"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("2"),
                      Text("Questions"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          scrollable: true,
                          content: ChangerMotPasse()),
                      barrierDismissible: true,
                    );
                  },
                  icon: const Icon(
                    Icons.edit_note_rounded,
                    color: Colors.lightBlue,
                  ),
                  label: const Text("Changer le mot de passe ")),
            ),
          ],
        ),
      ),
    );
  }
}
