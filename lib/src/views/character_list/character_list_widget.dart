import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../services/api_service.dart';
import '../character_detail/character_detail_page.dart';

class CharacterListWidget extends StatefulWidget {
  const CharacterListWidget({super.key});

  @override
  _CharacterListWidgetState createState() => _CharacterListWidgetState();
}

class _CharacterListWidgetState extends State<CharacterListWidget> {
  List<Character> characters = [];
  List<Character> filteredCharacters = [];
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreCharacters();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels /
                  _scrollController.position.maxScrollExtent >
              0.4 &&
          !isLoading) {
        _loadMoreCharacters();
      }
    });
  }

  void _loadMoreCharacters() async {
    setState(() {
      isLoading = true;
    });
    final apiService = MarvelApiService();
    final newCharacters =
        await apiService.fetchCharacters(offset: characters.length);
    setState(() {
      characters.addAll(newCharacters);
      filterSearchResults(searchController
          .text); // Updates filtered list after loading more characters
      isLoading = false;
    });
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Character> tempSearchResults = characters.where((element) {
        return element.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredCharacters = tempSearchResults;
      });
    } else {
      setState(() {
        filteredCharacters = characters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              filterSearchResults(value);
            },
          ),
        ),
        Expanded(
          child: filteredCharacters.isEmpty && searchController.text.isEmpty
              ? isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const Center(child: Text('No characters found.'))
              : ListView.builder(
                  controller: _scrollController, // Attach the scroll controller
                  itemCount: filteredCharacters.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == filteredCharacters.length) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final character = filteredCharacters[index];
                    return ListTile(
                      title: Text(character.name),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          '${character.thumbnail.path}.${character.thumbnail.extension}',
                        ),
                      ),
                      subtitle: Text(character.description.length > 30
                          ? '${character.description.substring(0, 30)} ...'
                          : character.description),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CharacterDetailPage(character: character),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
