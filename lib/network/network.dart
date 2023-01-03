import 'dart:convert';

import 'package:http/http.dart';
import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

class Network {
  // Other class members

  Future<WeatherForecastModel> getWeatherForecast(
      {required String cityName}) async {
    //https://api.openweathermap.org/data/2.5/forecast?q=jakarta&appid=982ac877c5afab8ab3860efb57b38e77
    // ignore: prefer_interpolation_to_compose_strings
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=imperial";
    // Make network request and process response
    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    // ignore: avoid_print
    print("URL:${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Invalid");
    }
  }
}
