import 'package:flutter/material.dart';
import 'constants.dart';

class NextDaysWeatherCard extends StatelessWidget {
  NextDaysWeatherCard({this.time, this.weatherIcon, this.temperature});

  final String time;
  final String weatherIcon;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          constraints: BoxConstraints.tightFor(
            width: 55,
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: kBorderColor, width: 1.5, style: BorderStyle.solid),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  time,
                  style: kNextWeatherTextStyle,
                ),
                Text(
                  weatherIcon,
                  style: kNextWeatherIcon,
                ),
                Text(
                  '$temperature°',
                  style: kNextTemperature,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
