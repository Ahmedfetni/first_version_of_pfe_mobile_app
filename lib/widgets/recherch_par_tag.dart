import 'package:flutter/material.dart';

class RecherchParTag extends SearchDelegate {
  @override
  String get searchFieldLabel => 'rechercher par un tag';
  List<String> resultatsDeRecherche = [
    "Mi",
    "PFE",
    "L3",
    "S1",
    "Algo",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) => [
        TextButton.icon(
            onPressed: () {
              query = "";
            },
            icon: const Icon(Icons.clear),
            label: const Text(""))
      ];

  @override
  Widget? buildLeading(BuildContext context) => TextButton.icon(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_rounded),
      label: const Text(""));

  @override
  Widget buildResults(BuildContext context) => Center(child: Text(query));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = resultatsDeRecherche.where((resultat) {
      return resultat.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: ((context, index) {
          final element = suggestions[index];
          return ListTile(
            onTap: (() {
              query = element;
              showResults(context);
            }),
            title: Text(element),
          );
        }));
  }
}
