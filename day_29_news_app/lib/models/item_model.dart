// Model class for Hacker News items
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
}

/*
The ':' in Dart is a constructor initializer list and it marks the beginning of the initializer list - a special section that runs before the constructor body {}. It's used to:
- Initialize final fields (which can't be set in the body)
- Call superclass constructors
- Initialize fields using expressions
 */
