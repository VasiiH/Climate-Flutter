import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    // print(location.latitude);
    // print(location.longitude);

  }

  void getData() async{
    Response response = await get('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=0ed13d359f543f1068186b4b6c0c7ad1');
    print(response.statusCode);
    print(response.body);
    print(response.hashCode);
    print(response.runtimeType);

  }
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: Text('build called'),

      ),
    );
  }
}
