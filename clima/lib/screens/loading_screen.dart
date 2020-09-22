import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  void getLocation() async {
    await location.getLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    print("latitude: $latitude, longitude: $longitude");
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=e72ca729af228beabd5d20e3b7749713');
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();

    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
