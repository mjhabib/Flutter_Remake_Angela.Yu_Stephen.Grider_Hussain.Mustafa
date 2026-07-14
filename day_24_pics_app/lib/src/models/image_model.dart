class ImageModel {
  final int id;
  final String url;
  final String title;

  // instead of having one initializer, we are allowed to have multiple ones. This is the normal one:
  ImageModel({required this.id, required this.url, required this.title});

  // and this one instead of getting each parameters one by one, it's gonna get the whole json at once, and assign each values to one of the variables:
  ImageModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      url = parsedJson['url'],
      title = parsedJson['title'];
}

/*
The ':' in Dart is a constructor initializer list and it marks the beginning of the initializer list - a special section that runs before the constructor body {}. It's used to:
- Initialize final fields (which can't be set in the body)
- Call superclass constructors
- Initialize fields using expressions
 */
