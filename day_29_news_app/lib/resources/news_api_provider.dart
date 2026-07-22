import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:news_app/models/item_model.dart';
import 'package:news_app/resources/repository_new.dart';

final String _newsEndpoint = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  final Client _client = Client();

  // get all the top news IDs
  // we could type this method as List<dynamic> and move on but we know we're gonna return a list of ids which is the type int, but the dart doesn't know that. So, if we change the type to List<int> dart is gonna complain, that's why we're gonna cast this method as int first then change the return type to List<int>.
  @override
  Future<List<int>> fetchTopIds() async {
    try {
      final response = await _client
          // If this request hasn't completed in 20 seconds, cancel it.
          .get(Uri.parse('$_newsEndpoint/topstories.json'))
          .timeout(const Duration(seconds: 20));

      // The condition of ">= 200" was wrong because it means even if we get a 300-400 or 500 error, that's OK, move on!
      if (response.statusCode == 200) {
        final ids = json.decode(response.body);
        return ids.cast<int>();
      } else {
        throw Exception('Failed to load item: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('The request timed out.');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // get one news at a time by passing an ID
  @override
  Future<ItemModel> fetchItem(int id) async {
    try {
      final response = await _client
          .get(Uri.parse('$_newsEndpoint/item/$id.json'))
          .timeout(const Duration(seconds: 20));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final parsedJson = json.decode(response.body);
        return ItemModel.fromJson(parsedJson);
      } else {
        throw Exception('Failed to load item: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('The request timed out.');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
