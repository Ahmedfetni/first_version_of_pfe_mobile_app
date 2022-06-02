import 'package:flutter/material.dart';
import '../pages/cree_compte.dart';
import '../pages/connexion.dart';

class ConnecterOuInscrire extends StatelessWidget {
  const ConnecterOuInscrire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Connexion())));
              },
              child: const Text(
                "Connexion",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CrierCompte())));
              },
              child: const Text(
                "Inscrire",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
    );
  }
}
