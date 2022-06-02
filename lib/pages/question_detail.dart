import 'package:flutter/material.dart';
import '../widgets/cartes/carte_reponse2.dart';
import '../control/Question.dart';
import '../control/Tag.dart';
import '../widgets/cartes/puce_tag.dart';
import '../control/ReponseDegre1.dart';
import '../widgets/cartes/carte_reponse1.dart';
import '../widgets/input/repondre_a_reponse.dart';

class QuestionDetail extends StatefulWidget {
  final Question question;

  const QuestionDetail({Key? key, required this.question}) : super(key: key);

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  List<bool> rependreVisible = [];
  late bool plusCliquer;
  late bool moinsCliquer;
  late Icon iconVoteMoins;
  late Icon iconVotePlus;
  late int vote;
  late bool visible;

  var ajouterUneReponseDegre1 = false;
  @override
  void initState() {
    for (ReponseDegre1 reponse in widget.question.getReponses) {
      rependreVisible.add(false);
    }
    visible = true;
    iconVotePlus = const Icon(
      Icons.thumb_up_off_alt,
      color: Colors.green,
    );
    iconVoteMoins = const Icon(
      Icons.thumb_down_off_alt,
      color: Colors.redAccent,
    );

    plusCliquer = false;
    moinsCliquer = false;
    vote = widget.question.vote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.blue,
                          width: 4),
                    ),
                    margin: const EdgeInsets.only(bottom: 10, top: 20),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.yellowAccent,
                      foregroundColor: Colors.blue,
                      child: Text(
                        widget.question.getNomUtilisateur
                            .substring(0, 2)
                            .toUpperCase(),
                      ),
                    ),
                  ),
                ),
                /* ******************** Titre du question ******************** */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          widget.question.getTitre,
                        ),
                      ),
                    ],
                  ),
                ),
                /* ******************** Corp du question ******************** */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          style: const TextStyle(fontSize: 18),
                          widget.question.getCorp,
                        ),
                      ),
                    ],
                  ),
                ),
                /* ******************** Les Tags ******************** */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: _listDesPuce(widget.question.getTags),
                  ),
                ),
                /* ******************** Les Buttons ******************** */
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        "$vote",
                      ),
                      //vote +
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              if (!plusCliquer) {
                                vote++;
                                iconVotePlus = const Icon(
                                  Icons.thumb_up_alt_rounded,
                                  color: Colors.green,
                                );
                              } else {
                                vote--;
                                iconVotePlus = const Icon(
                                  Icons.thumb_up_off_alt,
                                  color: Colors.green,
                                );
                              }
                              if (moinsCliquer) {
                                vote++;
                                moinsCliquer = !moinsCliquer;
                                iconVoteMoins = const Icon(
                                  Icons.thumb_down_off_alt,
                                  color: Colors.redAccent,
                                );
                              }
                              plusCliquer = !plusCliquer;
                            });
                          },
                          icon: iconVotePlus,
                          label: const Text("")),
                      //vote -
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              if (!moinsCliquer) {
                                vote--;
                                iconVoteMoins = const Icon(
                                  Icons.thumb_down_alt_rounded,
                                  color: Colors.redAccent,
                                );
                              } else {
                                vote++;
                                iconVoteMoins = const Icon(
                                  Icons.thumb_down_off_alt,
                                  color: Colors.redAccent,
                                );
                              }
                              if (plusCliquer) {
                                vote--;
                                iconVotePlus = const Icon(
                                  Icons.thumb_up_off_alt,
                                  color: Colors.green,
                                );
                                plusCliquer = !plusCliquer;
                              }
                              moinsCliquer = !moinsCliquer;
                            });
                          },
                          icon: iconVoteMoins,
                          label: const Text("")),
                      // Pour rependre
                      TextButton(
                        onPressed: () {
                          setState(() {
                            ajouterUneReponseDegre1 = !ajouterUneReponseDegre1;
                          });
                        },
                        child: const Icon(Icons.reply_rounded),
                      ),
                      //Pour sauvgarder une question
                      TextButton(
                        onPressed: () {
                          //TODO ajouter la fonctionalite
                        },
                        child: const Icon(Icons.bookmark_add_rounded),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  height: 1,
                  color: Colors.lightBlue,
                ),
                /* ************************* Ajouter une reponse  degre 01 **************************/
                Visibility(
                  visible: ajouterUneReponseDegre1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: TextField(
                      onSubmitted: (value) {
                        //TODO Ajouter une reponse de degre 01
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.lightBlue.shade100)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 1, color: Colors.lightBlue[600]!),
                          ),
                          hintText: "Ajouter votre reponse ",
                          suffixIcon: TextButton.icon(
                              onPressed: () {
                                //TODO passe le on submitted
                              },
                              icon: const Icon(
                                Icons.send_rounded,
                                color: Colors.lightBlue,
                              ),
                              label: const Text(""))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ..._listDesReponses(widget.question.getReponses),
        ],
      ),
    );
  }

  /* *************** Pour cree les puces *************** */
  List<Widget> _listDesPuce(List<Tag>? tags) {
    if (tags != null) {
      List<PuceTag> puces = [];
      for (var i = 0; i < tags.length; i++) {
        puces.add(PuceTag(tag: tags[i]));
      }
      return puces;
    }
    return <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: const Text("Pas de tag"),
      )
    ];
  }

/* ******** ******** */
  void _visibiliter(int index) {
    setState(() {
      rependreVisible[index] = !rependreVisible[index];
    });
  }

  /* *************** Pour une list des reponses *************** */
  List<SliverList> _listDesReponses(List<ReponseDegre1> li) {
    List<SliverList> liSliver = [];
    int i = 0;
    for (var reponse in li) {
      liSliver.add(SliverList(
          delegate: SliverChildListDelegate([
        CarteReponse(reponse: reponse, repondre: _visibiliter, index: i)
      ])));
      liSliver.add(SliverList(
          delegate: SliverChildListDelegate([
        RepondreAUneReponse(
          visible: rependreVisible[i],
          reponse1: reponse,
          index: i,
        )
      ])));
      liSliver.add(SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: reponse.getReponses.length,
          (context, index) => Container(
            margin: EdgeInsets.only(left: 30, right: 8),
            padding: const EdgeInsets.all(8.0),
            child: CarteReponse2(reponse: reponse.getReponses[index]),
          ),
        ),
      ));
      i++;
    }
    return liSliver;
  }
}
