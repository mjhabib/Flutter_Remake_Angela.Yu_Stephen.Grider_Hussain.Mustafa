// Model class for Hacker News items
import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  // Named constructor that creates an ItemModel from a JSON map.
  //
  // This uses an **initializer list** (after the colon :) which:
  // - Runs BEFORE the constructor body
  // - Is required for initializing 'final' fields
  // - Maps JSON keys directly to class properties
  //
  // Syntax: ConstructorName(...) : field = value, field2 = value2;
  // Note: No 'this.' keyword needed - we're assigning directly to fields
  ItemModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'] ?? 0,
      deleted = parsedJson['deleted'] ?? false,
      type = parsedJson['type'] ?? '',
      by = parsedJson['by'] ?? '',
      time = parsedJson['time'] ?? 0,
      text = parsedJson['text'] ?? '',
      dead = parsedJson['dead'] ?? false,
      parent = parsedJson['parent'] ?? 0,
      kids = parsedJson['kids'] ?? [],
      url = parsedJson['url'] ?? '',
      score = parsedJson['score'] ?? 0,
      title = parsedJson['title'] ?? '',
      descendants = parsedJson['descendants'] ?? 0;
  // handling null values by providing default values

  // this constructor is refactored to work with our DB, simply because it does not recognize some of our types (like bool or list), so we have to convert them
  ItemModel.fromDb(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'] ?? 0,
      // 1 == 1 = true ; 0 == 1 = false
      deleted = parsedJson['deleted'] == 1,
      type = parsedJson['type'] ?? '',
      by = parsedJson['by'] ?? '',
      time = parsedJson['time'] ?? 0,
      text = parsedJson['text'] ?? '',
      // 1 == 1 = true ; 0 == 1 = false
      dead = parsedJson['dead'] == 1,
      parent = parsedJson['parent'] ?? 0,
      // jsonDecode: Converting JSON String → Dart Object
      // Used for: Displaying data, calculations, business logic
      // Ex: {"name":"Bob"} → {'name' : 'Bob'}
      kids = jsonDecode(parsedJson['kids']) ?? [],
      url = parsedJson['url'] ?? '',
      score = parsedJson['score'] ?? 0,
      title = parsedJson['title'] ?? '',
      descendants = parsedJson['descendants'] ?? 0;

  // to insert these items to the DB, we need to convert them to the type of Map<String, dynamic>
  Map<String, dynamic> toMapForDb() {
    return {
      'id': id,
      // our DB doesn't understand bool, that's why we convert it to int
      'deleted': deleted ? 1 : 0,
      'type': type,
      'by': by,
      'time': time,
      'text': text,
      // our DB doesn't understand bool, that's why we convert it to int
      'dead': dead ? 1 : 0,
      'parent': parent,
      // jsonEncode: Converting Dart Object → JSON String
      // Used for: API requests, file storage, network transmission
      // Ex: {'name' : 'Alice'} → {"name":"Alice"
      'kids': jsonEncode(kids),
      'url': url,
      'score': score,
      'title': title,
      'descendants': descendants,
    };
  }
}

/*
The ':' in Dart is a constructor initializer list and it marks the beginning of the initializer list - a special section that runs before the constructor body {}. It's used to:
- Initialize final fields (which can't be set in the body)
- Call superclass constructors
- Initialize fields using expressions
 */
