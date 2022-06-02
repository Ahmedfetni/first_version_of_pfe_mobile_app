import 'package:flutter/material.dart';
import '../../control/Question.dart';
import 'package:intl/intl.dart';
import '../../pages/question_detail.dart';

class CarteQuestion extends StatefulWidget {
  final Question question;
  const CarteQuestion({Key? key, required this.question}) : super(key: key);
  @override
  State<CarteQuestion> createState() => _CarteQuestionState();
}

class _CarteQuestionState extends State<CarteQuestion> {
  late Color couleurVote;
  bool buttonDeVoteVisible = false;
  @override
  void initState() {
    couleurVote = widget.question.getVote > 0
        ? Colors.lightGreen
        : (widget.question.getVote < 0 ? Colors.redAccent : Colors.black);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onLongPress: () {
            setState(() {
              buttonDeVoteVisible = !buttonDeVoteVisible;
            });
          },
          child: Card(
            elevation: 5,
            color: Colors.grey.shade100,
            shadowColor: Colors.grey.shade700,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => QuestionDetail(
                                  question: widget.question,
                                ))));
                  },
                  leading: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.yellowAccent,
                      child: Text(
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        widget.question.getNomUtilisateur
                            .substring(0, 2)
                            .toUpperCase(),
                      ),
                    ),
                  ),
                  isThreeLine: true,

                  /* Le titre de la question */
                  title: Text(
                    //overflow: TextOverflow.ellipsis,
                    widget.question.getTitre,
                  ),

                  /* Le corp du la question  */
                  subtitle: Wrap(
                    children: [
                      Text(
                        //overflow: TextOverflow.ellipsis,
                        widget.question.getCorp,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.more_vert),
                ),

                /* La partie initalement invisible */
                Container(
                  margin:
                      const EdgeInsets.only(left: 30, bottom: 10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: couleurVote,
                        ),
                        "${widget.question.vote}",
                      ),
                      Text("${widget.question.getReponses.length} Réponse"),
                      Text(DateFormat("yyyy-MM-dd – kk:mm")
                          .format(widget.question.getDate)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        /* ******************Les bouttons de votes·****************** */
        Visibility(
          visible: buttonDeVoteVisible,
          child: Positioned.fill(
            child: InkWell(
              onTap: () {
                setState(() {
                  buttonDeVoteVisible = !buttonDeVoteVisible;
                });
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white54),
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.thumb_up_alt_rounded,
                          color: Colors.greenAccent,
                          size: 40,
                        ),
                        label: const Text("")),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.thumb_down_alt_rounded,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                        label: const Text("")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
