import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currencyList = [
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'RUB',
];

const String usd = 'USD';

const apiKey = 'Secret API Key';

class USDData {
  Future getUSDDataMap(String selectedCurrency, String usd) async {
    Map<String, String> convertedToSelectedCurrency = {};
    final httpUri = Uri.http('api.exchangeratesapi.io', '/v1/latest', {
      'access_key': apiKey,
    });

    var response = await http.get(httpUri);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double price = decodedData['rates'][selectedCurrency];
      convertedToSelectedCurrency[usd] = price.toStringAsFixed(2);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return convertedToSelectedCurrency;
  }
}
