// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_api/model/weather_forecast_model.dart';

import '../constants.dart';
import '../network/network.dart';
import 'mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Jakarta";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(_cityName);

    // ignore: avoid_print
    // forecastObject.then((weather) => {print(weather.city!.name)});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: size.width > 600
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              size.width > 600
                  ? Container()
                  : Lottie.asset(
                      'assets/wave.json',
                      width: double.infinity,
                      height: size.height * 0.2,
                      fit: BoxFit.fill,
                      animate: true,
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Weather App",
                  style: appTitleStyle(size),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              //Here Widget's
              FormFieldText(),

              Center(
                child: Container(
                    child: FutureBuilder(
                  future: forecastObject,
                  builder: (BuildContext context,
                      AsyncSnapshot<WeatherForecastModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          midView(snapshot),
                        ],
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                )),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget FormFieldText() {
    return Form(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextFormField(
                style: appTextFormFieldStyle(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Enter City Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onFieldSubmitted: (value) {
                  setState(() {
                    _cityName = value;
                    forecastObject = getWeather(_cityName);
                  });
                },
              )
            ],
          )),
    );
  }

  Future<WeatherForecastModel> getWeather(String cityName) =>
      new Network().getWeatherForecast(cityName: _cityName);
}
