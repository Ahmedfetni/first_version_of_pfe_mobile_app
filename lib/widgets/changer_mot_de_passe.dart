import 'package:flutter/material.dart';

class ChangerMotPasse extends StatefulWidget {
  const ChangerMotPasse({Key? key}) : super(key: key);

  @override
  State<ChangerMotPasse> createState() => _ChangerMotPasseState();
}

class _ChangerMotPasseState extends State<ChangerMotPasse> {
  var textInvisible = false;
  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      /* L'icon pour controller la visibilite du mot de passe  */
      suffixIcon: TextButton.icon(
        onPressed: () {
          setState(() {
            textInvisible = !textInvisible;
          });
        },
        icon: (textInvisible
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility)),
        label: const Text(""),
      ),

      fillColor: Colors.lightBlue[10], //couleur du font
      filled: true,

      label: const Text(
        "Mot de passe",
        style: TextStyle(color: Colors.lightBlue),
      ),
      alignLabelWithHint: true,

      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: Colors.lightBlue.shade100)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1, color: Colors.lightBlue[600]!),
      ),
      /* **************************** */
      hintText: "votre mot de passe",
      hintStyle: TextStyle(
        fontSize: 18,
        color: Colors.lightBlue[200],
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextField(
            obscureText: textInvisible,
            decoration: decoration.copyWith(
              hintText: "ancien mot de passe",
            )),
        const SizedBox(
          height: 30,
        ),
        TextField(
          obscureText: textInvisible,
          decoration: decoration.copyWith(
              hintText: " Nouveau mot de passe ",
              label: const Text("Nouveau mot de passe ")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120, top: 30),
          child: TextButton(onPressed: () {}, child: const Text("confirmer")),
        )
      ],
    );
  }
}
