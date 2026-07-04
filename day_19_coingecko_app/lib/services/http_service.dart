import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  final _coinAPI = dotenv.get('COIN_GECKO_API');
  final String _coinEndpoint = 'https://api.coingecko.com/api/v3/';

  // send a http get request using 'Dio' package
  Future<Response?> sendRequestByDio(String path) async {
    final Dio dio = Dio();
    try {
      String url = '$_coinEndpoint$path';
      Response response = await dio.get(
        url,
        options: Options(headers: {'x_cg_demo_api_key': _coinAPI}),
      );
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }

  // send a http get request using 'http' package
  Future<String> sendRequestByHttp(String path) async {
    String url = '$_coinEndpoint$path';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'x_cg_demo_api_key': _coinAPI},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("Error: ${response.statusCode}");
      return '';
    }
  }
}
