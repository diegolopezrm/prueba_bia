class Character {
  final int id;
  final String name;
  final String description;
  final DateTime modified;
  final String resourceURI;
  final List<Url> urls;
  final Image thumbnail;
  final ComicList comics;
  final StoryList stories;
  final EventList events;
  final SeriesList series;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: DateTime.parse(json['modified']),
      resourceURI: json['resourceURI'],
      urls: (json['urls'] as List).map((e) => Url.fromJson(e)).toList(),
      thumbnail: Image.fromJson(json['thumbnail']),
      comics: ComicList.fromJson(json['comics']),
      stories: StoryList.fromJson(json['stories']),
      events: EventList.fromJson(json['events']),
      series: SeriesList.fromJson(json['series']),
    );
  }
}

class Url {
  final String type;
  final String url;

  Url({required this.type, required this.url});

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      type: json['type'],
      url: json['url'],
    );
  }
}

class Image {
  final String path;
  final String extension;

  Image({required this.path, required this.extension});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      path: json['path'],
      extension: json['extension'],
    );
  }
}

class ComicList {
  final int available;
  final int returned;
  final String collectionURI;
  final List<ComicSummary> items;

  ComicList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  factory ComicList.fromJson(Map<String, dynamic> json) {
    return ComicList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List)
          .map((e) => ComicSummary.fromJson(e))
          .toList(),
    );
  }
}

class ComicSummary {
  final String resourceURI;
  final String name;

  ComicSummary({required this.resourceURI, required this.name});

  factory ComicSummary.fromJson(Map<String, dynamic> json) {
    return ComicSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}

// Similar a ComicList y ComicSummary, puedes construir los modelos para:
// StoryList, StorySummary, EventList, EventSummary, SeriesList, SeriesSummary.

class StoryList {
  final int available;
  final int returned;
  final String collectionURI;
  final List<StorySummary> items;

  StoryList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  factory StoryList.fromJson(Map<String, dynamic> json) {
    return StoryList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List)
          .map((e) => StorySummary.fromJson(e))
          .toList(),
    );
  }
}

class StorySummary {
  final String resourceURI;
  final String name;
  final String type;

  StorySummary({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  factory StorySummary.fromJson(Map<String, dynamic> json) {
    return StorySummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
      type: json['type'],
    );
  }
}

class EventList {
  final int available;
  final int returned;
  final String collectionURI;
  final List<EventSummary> items;

  EventList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  factory EventList.fromJson(Map<String, dynamic> json) {
    return EventList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List)
          .map((e) => EventSummary.fromJson(e))
          .toList(),
    );
  }
}

class EventSummary {
  final String resourceURI;
  final String name;

  EventSummary({
    required this.resourceURI,
    required this.name,
  });

  factory EventSummary.fromJson(Map<String, dynamic> json) {
    return EventSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}

class SeriesList {
  final int available;
  final int returned;
  final String collectionURI;
  final List<SeriesSummary> items;

  SeriesList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  factory SeriesList.fromJson(Map<String, dynamic> json) {
    return SeriesList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: (json['items'] as List)
          .map((e) => SeriesSummary.fromJson(e))
          .toList(),
    );
  }
}

class SeriesSummary {
  final String resourceURI;
  final String name;

  SeriesSummary({
    required this.resourceURI,
    required this.name,
  });

  factory SeriesSummary.fromJson(Map<String, dynamic> json) {
    return SeriesSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}

