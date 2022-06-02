import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Connexion extends StatefulWidget {
  Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool textInvisible = true;
  final formKey = GlobalKey<FormState>();
  late String email, motDePasse;
  @override
  Widget build(BuildContext context) {
    final motDePasseDecoration = InputDecoration(
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

    final emailDecoration = InputDecoration(
      /* L'icon pour controller la visibilite du mot de passe  */
      suffixIcon: const Icon(
        Icons.email,
        color: Colors.lightBlue,
      ),

      fillColor: Colors.lightBlue[10], //couleur du font
      filled: true,

      label: const Text(
        "Email",
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
      hintText: "Introduire votre adresse email",
      hintStyle: TextStyle(
        fontSize: 18,
        color: Colors.lightBlue[200],
      ),
    );

    return Scaffold(
      appBar: AppBar(
          leading: TextButton.icon(
              onPressed: () {
                //TODO  adding a navigator pop
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              label: const Text(""))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                /* ********************************Choisir l'email******************************** */
                TextFormField(
                  decoration: emailDecoration,
                  onChanged: (val) => {
                    setState(
                      () {
                        email = val;
                      },
                    )
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "vous dever introduire une adresse email";
                    } else if (!EmailValidator.validate(val)) {
                      return "Introduire une adresse email valid";
                    } else {
                      return null;
                    }
                  },
                ),
                /* *************** Espace vide ***************** */
                _espaceVide(),

                /* ********************************  choisir le mot de passe *********************************/
                TextFormField(
                  decoration: motDePasseDecoration,
                  obscureText:
                      textInvisible, //pour rendre le mot de passe visible ou invisble
                  onChanged: (val) => {
                    setState(
                      () {
                        motDePasse = val;
                      },
                    ),
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Introduire une adresse email valid";
                    } else if (val.length < 8) {
                      return "Votre mot de passe dois etre au moins 8 charachteres";
                    } else {
                      return null;
                    }
                  },
                ),

                /* *************** Espace vide ***************** */
                _espaceVide(),
                /* ************************************ Bouton pour le submit ************************************ */
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.6),
                  padding: EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Login avec succees")));
                      }
                    },
                    style: TextButton.styleFrom(
                      elevation: 2,
                      backgroundColor: Colors.lightBlue.shade300,
                    ),
                    child: const Text(
                      "Connexion",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* Pour Cree une espace  vide */
  _espaceVide() => SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      );
}
