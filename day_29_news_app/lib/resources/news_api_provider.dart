import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:news_app/models/item_model.dart';

final String _newsEndpoint = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  final Client _client = Client();

  // get all the top news IDs
  Future<List<dynamic>> fetchTopIds() async {
    try {
      final response = await _client.get(
        Uri.parse('$_newsEndpoint/topstories.json'),
      );

      if (response.statusCode >= 200) {
        final ids = json.decode(response.body);
        return ids;
      } else {
        throw ('Failed to load item: ${response.statusCode}');
      }
    } catch (e) {
      throw ('Error: $e');
    }
  }

  // get one news at a time by passing an ID
  Future<ItemModel> fetchItem(int id) async {
    try {
      final response = await _client.get(
        Uri.parse('$_newsEndpoint/item/$id.json'),
      );

      if (response.statusCode >= 200) {
        final parsedJson = json.decode(response.body);
        return ItemModel.fromJson(parsedJson);
      } else {
        throw ('Failed to load item: ${response.statusCode}');
      }
    } catch (e) {
      throw ('Error: $e');
    }
  }
}
