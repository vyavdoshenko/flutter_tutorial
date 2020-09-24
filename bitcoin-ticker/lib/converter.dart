import 'package:bitcoin_ticker/networking.dart';

const baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
const token = '05B737B8-EF2E-4673-A791-171752BE1F9C';

class Converter {
  Future getRate(String from, String to) async {
    NetworkHelper networkHelper =
        NetworkHelper('$baseUrl/$from/$to?apikey=$token');
    return await networkHelper.getData();
  }
}
