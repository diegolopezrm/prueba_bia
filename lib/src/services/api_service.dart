import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class MarvelApiService {
  final String _baseUrl = 'https://gateway.marvel.com/v1/public';
  final String _apiKey = 'db1e60bea321696fd405be78d453c360';
  final String _privateKey = '9c153d5ccc2480d7e3c5015299fdb0aa145d1933';

  Future<Character> fetchCharacterById(int id) async {
    final String ts = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = generateMd5('$ts$_privateKey$_apiKey');

    final response = await http.get(
      Uri.parse('$_baseUrl/characters/$id?ts=$ts&apikey=$_apiKey&hash=$hash'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Character.fromJson(data['data']['results'][0]);
    } else {
      throw Exception('Failed to load character');
    }
  }

  //fetch chracters all
  Future<List<Character>> fetchCharacters({int offset = 0}) async {
    final String ts = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = generateMd5('$ts$_privateKey$_apiKey');

    final response = await http.get(
      Uri.parse(
          '$_baseUrl/characters?ts=$ts&apikey=$_apiKey&hash=$hash&limit=100&offset=$offset'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return (data['data']['results'] as List)
          .map((e) => Character.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  String generateMd5(String data) {
    final bytes = utf8.encode(data);
    return md5.convert(bytes).toString();
  }
}
