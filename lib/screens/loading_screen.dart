import 'dart:ui';
import 'package:weaknow/utilities/location_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weaknow/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weaknow/utilities/constants.dart';
import 'package:android_intent/android_intent.dart';
import 'location_screen.dart';
import 'package:weaknow/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location _location = Location();
  dynamic weatherCurrentData;
  dynamic weatherWeeklyData;
  AndroidIntent intent =
      AndroidIntent(action: 'android.settings.LOCATION_SOURCE_SETTINGS');

  @override
  void initState() {
    super.initState();
    _location.checkGps();
  }

  void getWeatherData() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      updateStatus(GeolocationStatus.denied);
      intent.launch();
      if (await Geolocator().isLocationServiceEnabled()) {
        updateStatus(GeolocationStatus.granted);
      } else
        return;
    } else {
      updateStatus(GeolocationStatus.granted);
      weatherCurrentData = await WeatherModal().getCurrentWeatherData();
      print(weatherCurrentData);
      weatherWeeklyData = await WeatherModal().getWeeklyWeatherData();
      print(weatherWeeklyData);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
              weatherCurrentData: weatherCurrentData,
              weatherWeeklyData: weatherWeeklyData,
            );
          },
        ),
      );
    }
  }

  void updateStatus(GeolocationStatus statusArg){
    setState(() {
      _location.status = statusArg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                    topLeft: Radius.circular(50.0),
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('images/flatPeopleWalking.jpg'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Everything About The',
                      style: kWelcomeMainHeading,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Weather At A Glance!',
                      style: kWelcomeMainHeading,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'This Weather App will accurately display ',
                      style: kWelcomeSubTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'current weather conditions in no time.',
                      style: kWelcomeSubTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    LocationButton(
                      onpressed: (){
                        getWeatherData();
                      },
                      locationIcon: kNavigateNext,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
