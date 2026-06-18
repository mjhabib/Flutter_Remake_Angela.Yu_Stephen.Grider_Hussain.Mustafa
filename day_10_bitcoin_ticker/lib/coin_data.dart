// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
];

const Map<String, int> cryptoList = {'BTC': 64000, 'ETH': 1750, 'LTC': 45};

class CoinData {
  // API providers have limitations (subscription, pricing, etc...), so I'm gonna make up my own data

  // final apiKey = dotenv.get('FREE_CRYPTO_API');
  // final String freeCryptoEndpoint =
  //     'https://api.freecryptoapi.com/v1/getCryptoList';

  // void getData() async {
  //   final uri = Uri.parse(freeCryptoEndpoint);
  //   try {
  //     final response = await http.get(
  //       uri,
  //       headers: {'accept': '*/*', 'Authorization': 'Bearer $apiKey'},
  //     );
  //     String data = response.body;
  //     print(data);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Map<String, int> getData() {
    return cryptoList;
  }
}
