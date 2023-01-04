// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_new, unnecessary_string_interpolations, avoid_unnecessary_containers
// import '../constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_api/constants.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var city = snapshot.data!.city!.name;
  var country = snapshot.data!.city!.country;
  // var forecast = forecastList[0];
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "${city}, ${country}",
            style:
                GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          "${Util.getFormattedDate(formattedDate)}",
          style: appTextFormFieldStyle(),
        ),
        Lottie.asset('assets/loading.json', fit: BoxFit.fitWidth),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${forecastList[0].main!.humidity!.toStringAsFixed(0)}°F")
            ],
          ),
        )
      ],
    ),
  );
  return midView;
}
