import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_bia/src/models/character.dart';

void main() {
  group('Character Model', () {
    // Datos para las pruebas
    final characterJson = {
      'id': 1,
      'name': 'Spider-Man',
      'description': 'A superhero',
      'modified': '2023-07-27T00:00:00Z',
      'resourceURI': 'http://example.com/resource',
      'urls': [{'type': 'wiki', 'url': 'http://example.com/wiki'}],
      'thumbnail': {'path': 'http://example.com/image', 'extension': 'jpg'},
      'comics': {
        'available': 1,
        'returned': 1,
        'collectionURI': 'http://example.com/comics',
        'items': [{'resourceURI': 'http://example.com/comic1', 'name': 'Comic 1'}],
      },
      'stories': {
        'available': 1,
        'returned': 1,
        'collectionURI': 'http://example.com/stories',
        'items': [{'resourceURI': 'http://example.com/story1', 'name': 'Story 1', 'type': 'type1'}],
      },
      'events': {
        'available': 1,
        'returned': 1,
        'collectionURI': 'http://example.com/events',
        'items': [{'resourceURI': 'http://example.com/event1', 'name': 'Event 1'}],
      },
      'series': {
        'available': 1,
        'returned': 1,
        'collectionURI': 'http://example.com/series',
        'items': [{'resourceURI': 'http://example.com/series1', 'name': 'Series 1'}],
      },
    };

    test('should create a character with the correct values', () {
      final character = Character.fromJson(characterJson);

      expect(character.id, 1);
      expect(character.name, 'Spider-Man');
      expect(character.description, 'A superhero');
      expect(character.urls[0].type, 'wiki');
      expect(character.urls[0].url, 'http://example.com/wiki');
      expect(character.thumbnail.path, 'http://example.com/image');
      expect(character.thumbnail.extension, 'jpg');
      expect(character.comics.items[0].name, 'Comic 1');
      expect(character.stories.items[0].type, 'type1');
    });
  });
}
