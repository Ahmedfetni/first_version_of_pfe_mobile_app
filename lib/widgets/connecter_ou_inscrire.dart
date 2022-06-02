import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: const Text(
                "Connexion",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Inscrire",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
    );
  }
}
