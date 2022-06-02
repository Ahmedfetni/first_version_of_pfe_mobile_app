import 'package:flutter/material.dart';
import '../../control/ReponseDegre1.dart';
import '../../control/ReponseDegre2.dart';

class RepondreAUneReponse extends StatefulWidget {
  bool visible;
  int index;
  ReponseDegre1 reponse1;
  RepondreAUneReponse({
    Key? key,
    required this.visible,
    required this.reponse1,
    required this.index,
  }) : super(key: key);

  @override
  State<RepondreAUneReponse> createState() => _RepondreAUneReponseState();
}

class _RepondreAUneReponseState extends State<RepondreAUneReponse> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 8),
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              autofocus: true,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(
                suffixIcon: const Icon(Icons.send_rounded),
                hintText: "Ecrire votre reponse",
              ),
              onSubmitted: (value) {
                setState(() {
                  widget.reponse1.ajouterUneReponse(ReponseDegre2(
                    nomUtilisateur: "ahmed",
                    date: DateTime.now(),
                    text: value,
                  ));
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
