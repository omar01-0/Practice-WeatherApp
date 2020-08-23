import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weaknow/utilities/constants.dart';
import 'package:weaknow/utilities/weather_card.dart';
import 'package:weaknow/utilities/next_day_weather_card.dart';
import 'package:weaknow/services/weather.dart';
import 'package:weaknow/services/parse_json_data.dart';
import 'package:weaknow/services/parse_weekly_json_data.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherCurrentData, this.weatherWeeklyData});

  final dynamic weatherCurrentData;
  final dynamic weatherWeeklyData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModal weather = WeatherModal();
  ParseJsonData parseJsonData;
  ParseWeeklyData parseWeeklyData;

  @override
  void initState() {
    updateInfo(widget.weatherCurrentData, widget.weatherWeeklyData);
    super.initState();
  }

  void updateInfo(dynamic weatherCurrentData, dynamic weatherWeeklyData) {
    setState(() {
      parseJsonData = ParseJsonData.fromJson(weatherCurrentData);
      parseWeeklyData = ParseWeeklyData.fromJson(weatherWeeklyData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            dynamic currentWeatherData =
                                await weather.getCurrentWeatherData();
                            dynamic weeklyWeatherData =
                                await weather.getWeeklyWeatherData();
                            updateInfo(currentWeatherData, weeklyWeatherData);
                          },
                          child: kUpdateLocation,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: kSearchLocation,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            parseJsonData.name,
                            style: kWelcomeMainHeading,
                          ),
                          Text(
                            parseJsonData.sys.country,
                            style: kWelcomeMainHeading,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Today',
                    style: kWelcomeMainHeading,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        weather.getWeatherIcon(parseJsonData.weather[0].id),
                        style: TextStyle(
                            fontSize: 70.0, decorationColor: kBorderColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  parseJsonData.main.temp.toString(),
                                  style: kTemperatureTextStyle,
                                ),
                                Text(
                                  '°C',
                                  style: kCelciusTextStyle,
                                ),
                              ],
                            ),
                            Text(
                              parseJsonData.weather[0].description,
                              style: kWelcomeSubTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      WeatherCard(
                        icon: kWindIcon,
                        value: '${parseJsonData.wind.speed} m/s',
                      ),
                      WeatherCard(
                        icon: kCloudIcon,
                        value: '${parseJsonData.clouds.all} %',
                      ),
                      WeatherCard(
                        icon: kUmbrellaIcon,
                        value: '${parseJsonData.main.humidity} %',
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Next 7 Days',
                      style: kTodayHeading,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 20, bottom: 30.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, int index) {
                          return NextDaysWeatherCard(
                            time: parseWeeklyData.daily[index].time,
                            weatherIcon: weather.getWeatherIcon(parseWeeklyData.daily[index].weather[0].id),
                            temperature: parseWeeklyData.daily[index].temp.day.toString(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
