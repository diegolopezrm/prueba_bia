import 'package:flutter/material.dart';

import '../../models/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 224, 227),
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Hero(
              tag: character.id,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${character.thumbnail.path}.${character.thumbnail.extension}',
                ),
                radius: 100,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            character.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          //horizontal listview with card to see numbers of comics, series, stories and events
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    character.comics.available.toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text('Comics'),
                ],
              ),
              Column(
                children: [
                  Text(
                    character.series.available.toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text('Series'),
                ],
              ),
              Column(
                children: [
                  Text(
                    character.stories.available.toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text('Stories'),
                ],
              ),
              Column(
                children: [
                  Text(
                    character.events.available.toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text('Events'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            character.description.isEmpty || character.description == ''
                ? 'No description available.'
                : character.description,
            style: const TextStyle(fontSize: 16),
          ),
          //grid with all more details
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
