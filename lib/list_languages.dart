import 'package:flutter/material.dart';
import 'package:my_app/languages.dart';

class ListLanguagesState extends StatefulWidget {
  const ListLanguagesState({super.key});

  @override
  State<ListLanguagesState> createState() => _ListLanguagesStateState();
}

class _ListLanguagesStateState extends State<ListLanguagesState> {
  List<Language> languages = [
    Language("Android Nativo", "Linguagens C, Java e Kotlin", "1"),
    Language("IOS Nativo", "Linguagens Objective-C e Swift", "2"),
    Language("Flutter", "Linguagens Objective-C e Swift", "2"),
    Language("React Native", "Linguagens Objective-C e Swift", "2"),
    Language("PWA", "Linguagens Objective-C e Swift", "2"),
    Language("Ionic", "Linguagens Objective-C e Swift", "2"),
  ];

  List<ChoiceChip> _buildChips() {
    return languages
        .map((language) => ChoiceChip(
            label: Text(language.name),
            selected: language.selected,
            onSelected: (value) {
              setState(() {
                language.selected = value;
              });
            }))
        .toList();
  }

  List<Card> _buildCards() {
    return languages
        .where((language) => language.selected)
        .map((language) => Card(
              child: ListTile(
                leading: Text(language.id),
                title: Text(language.name),
                subtitle: Text(language.description),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Wrap(
            spacing: 10,
            children: _buildChips(),
          ),
        ),
        Expanded(
            child: ListView(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          children: _buildCards(),
        ))
      ],
    );
  }
}
