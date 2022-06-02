import 'package:flutter/material.dart';
import 'package:flutter_learning_about_themes_and_texts/widgets/connecter_ou_inscrire.dart';

class Navigation extends StatefulWidget {
  bool utilisateurConnecter;
  Navigation({Key? key, required this.utilisateurConnecter}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8,
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Material(
          child: widget.utilisateurConnecter
              ? ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 100, top: 20),
                      height: MediaQuery.of(context).size.width / 4,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.blueAccent),
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                            minRadius: MediaQuery.of(context).size.width * 0.1,
                            backgroundColor: Colors.yellowAccent,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Mohammed",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 3,
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.settings_rounded,
                        color: Colors.black,
                      ),
                      title: Text("Parametres"),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.logout_rounded,
                        color: Colors.black,
                      ),
                      title: Text("Deconnexion"),
                      onTap: () {},
                    ),
                  ],
                )
              : ConnecterOuInscrire(),
        ),
      ),
    );
  }
}
