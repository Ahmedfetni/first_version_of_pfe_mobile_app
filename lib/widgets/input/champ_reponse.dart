import 'dart:js';

import 'package:flutter/material.dart';

class champReponse extends StatefulWidget {
  champReponse({Key? key}) : super(key: key);

  @override
  State<champReponse> createState() => _champReponseState();
}

class _champReponseState extends State<champReponse> {
  var reponseController = TextEditingController();
  String reponse = "";
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 10,
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: TextField(
          autofocus: true,
          controller: reponseController,
          textInputAction: TextInputAction.send,
          onSubmitted: ajouterReponse(reponseController.text),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: ajouterReponse(reponseController.text),
              child: const Icon(Icons.reply_rounded),
            ),
            hintText: "Votre Reponse",
          ),
        ),
      ),
    );
  }

  /* ************* Ajouter une reponse ************* */
  ajouterReponse(String str) {
    setState(() {
      reponse = str;
    });
    //Navigator.of(context).pop(context);
    //debugPrint(reponse);
  }
}
