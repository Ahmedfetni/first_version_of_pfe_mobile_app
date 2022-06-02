import 'package:flutter/material.dart';
import 'package:flutter_learning_about_themes_and_texts/control/Espace.dart';

class CarteEspaceConstant extends StatefulWidget {
  Espace espace;
  String image;
  CarteEspaceConstant({Key? key, required this.espace, required this.image})
      : super(key: key);

  @override
  State<CarteEspaceConstant> createState() => _CarteEspaceConstantState();
}

class _CarteEspaceConstantState extends State<CarteEspaceConstant> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: 120,
                width: 120,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/${widget.image}"),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      widget.espace.getNom,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_rounded,
                      color: Colors.lightBlue,
                    ),
                    label: const Text("")),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "Nombre des question ${widget.espace.getQuestions.length}"),
                Text(
                    "Nombre des utilisateur ${widget.espace.getUtilisateur.length}"),
              ],
            ),
          )
        ],
      ),
    );
  }
  /*
  
    ListTile(
        dense: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/${widget.image}"),
          ),
        ),
        title: Text(
          widget.espace.getNom,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
        ),
        trailing: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add_rounded,
              color: Colors.lightBlue,
            ),
            label: const Text("")),
      ), 
   */

}
