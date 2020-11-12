import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '0ed13d359f543f1068186b4b6c0c7ad1';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      String weather = decodedData['weather'][0]['description'];
      print(weather);

      String city = decodedData['name'];
      print(city);

      int temperature = decodedData['weather'][0]['id'];
      print(temperature);
    } else {
      print(response.statusCode);
    }
    // print(response.body);
    // print(response.hashCode);
    // print(response.runtimeType);
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text('build called'),
      ),
    );
  }
}
