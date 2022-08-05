import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model.dart';


class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '9ee40209629bec551f6b79f42c18d09c';

    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path:  'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('failed');
    }

  }
}