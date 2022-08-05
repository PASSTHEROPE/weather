import 'package:flutter/material.dart';
import '../model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({
    required this.weatherModel,
    Key? key}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card( margin: EdgeInsets.all(0),
      child: Column(
        children: [
        Icon(Icons.image, color: Colors.yellow),
        const SizedBox(height: 10),
        Text('${weatherModel.main.temp.toInt()-273}c'),
        const SizedBox(height:10),
        Text('${weatherModel.name}'),
        const SizedBox(height:10),
        Text('${weatherModel.weather.first.description}'),
        const SizedBox(height: 10),
        Text("${weatherModel.main.feelsLike.toInt()-273}c"),
        const SizedBox(height: 10,),
        Text("${weatherModel.main.tempMax.toInt()-273}c"),
        const SizedBox(height: 10),
        Text("${weatherModel.main.humidity}%"),
        ],
      )
    );
  }
}
