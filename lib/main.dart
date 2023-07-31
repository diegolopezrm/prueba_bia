import 'package:flutter/material.dart';
import 'src/views/character_list/character_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Characters',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CharacterListPage(),
    );
  }
}
