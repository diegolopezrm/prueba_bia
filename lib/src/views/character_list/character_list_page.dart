import 'package:flutter/material.dart';
import 'character_list_widget.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 249, 224, 227),
      appBar: AppBar(title: const Text("Marvel Characters")),
      body: const CharacterListWidget(),
    );
  }
}
