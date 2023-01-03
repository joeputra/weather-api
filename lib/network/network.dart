import 'dart:convert';

import 'package:http/http.dart';
import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

class Network {
  // Other class members

  Future<WeatherForecastModel> getWeatherForecast(
      {required String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=imperial";
    // Make network request and process response
    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    print("URL:${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Invalid");
    }
  }
}
