import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Weather App",
                  style: appSubtitleStyle(size),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
