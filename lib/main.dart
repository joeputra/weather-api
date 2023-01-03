import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/weather_forecast.dart';

void main() => runApp(new GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherForecast(),
    ));