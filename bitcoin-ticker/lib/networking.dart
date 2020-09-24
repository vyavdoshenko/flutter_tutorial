import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      double rate = jsonDecode(data)['rate'];
      return (1.0 / rate).toStringAsFixed(0);
    } else {
      return '-100';
    }
  }
}
