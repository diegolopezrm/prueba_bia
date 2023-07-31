import 'package:flutter/material.dart';
import 'character_list_widget.dart';

class CharacterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marvel Characters")),
      body: CharacterListWidget(),
    );
  }
}
