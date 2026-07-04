import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  final Dio _dio = Dio();
  final _coinAPI = dotenv.get('COIN_GECKO_API');
  final String _coinEndpoint = 'https://api.coingecko.com/api/v3/';

  Future<Response?> sendRequest(String path) async {
    try {
      String url = '$_coinEndpoint$path';
      Response response = await _dio.get(
        url,
        options: Options(headers: {'x_cg_demo_api_key': _coinAPI}),
      );
      print(response);
      return response;
    } catch (e) {
      print(e);
      CircularProgressIndicator();
    }
    return null;
  }
}
