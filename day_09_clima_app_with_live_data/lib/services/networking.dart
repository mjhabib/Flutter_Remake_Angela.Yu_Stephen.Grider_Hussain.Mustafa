import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper({required this.url});

  // send a http get request using 'http' package
  Future<Map<String, dynamic>> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      // this how we can decode our Json data
      var decodedJson = jsonDecode(data);

      // Extracting data
      String city = decodedJson["name"];
      double temp = decodedJson["main"]["temp"];
      int conditionID = decodedJson["weather"][0]["id"];

      // Return the map directly
      return {"city": city, "temp": temp, "id": conditionID};
    } else {
      print("Error: ${response.statusCode}");
      // Return an empty map or throw an error if the call fails
      return {};
    }
  }
}
