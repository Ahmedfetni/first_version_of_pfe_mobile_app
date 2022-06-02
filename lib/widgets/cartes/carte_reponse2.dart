import 'package:flutter/material.dart';
import '../../control/ReponseDegre2.dart';

class CarteReponse2 extends StatefulWidget {
  ReponseDegre2 reponse;
  CarteReponse2({Key? key, required this.reponse}) : super(key: key);

  @override
  State<CarteReponse2> createState() => _CarteReponse2State();
}

class _CarteReponse2State extends State<CarteReponse2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.reponse.plusVote();
        });
      },
      onDoubleTap: () {
        setState(() {
          widget.reponse.moinsVote();
        });
      },
      onLongPress: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        child: ListTile(
          trailing: Text("${widget.reponse.getVote}",
              style: TextStyle(color: Colors.lightBlue)),
          title: Wrap(
            children: [
              Text(
                widget.reponse.getText,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text(
            "${widget.reponse.getDate} par ${widget.reponse.getNomUtilisateur}",
            style: TextStyle(color: Colors.lightBlue),
          ),
        ),
      ),
    );
  }
}
