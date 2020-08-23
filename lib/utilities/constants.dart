import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String kAPIKey = 'da6ba08ac3826dd213e07dd295eb8b21';
const String kURLCurrent = 'https://api.openweathermap.org/data/2.5/weather';
const String kURLWeekly = 'https://api.openweathermap.org/data/2.5/onecall';


const kPrimaryColor = Colors.white;
const kButtonsColor = Color(0xFFA2ACFF);
const kBorderColor = Color(0xFFADB1CC);
const kFontColor = Color(0xFF333866);

const kLocationIconOn = Icon(Icons.location_on, color: kPrimaryColor,size: 40,);
const kLocationIconOff = Icon(Icons.location_off, color: kFontColor,size: 40,);
const kUpdateLocation = FaIcon(FontAwesomeIcons.locationArrow, color: kFontColor,size: 30,);
const kSearchLocation = FaIcon(Icons.location_searching, color: kFontColor,size: 40,);
const kCloudIcon = FaIcon(FontAwesomeIcons.cloud, color: kPrimaryColor, size: 20,);
const kWindIcon = FaIcon(FontAwesomeIcons.wind, color: kPrimaryColor,);
const kUmbrellaIcon = FaIcon(FontAwesomeIcons.water, color: kPrimaryColor,);

const kWelcomeMainHeading = TextStyle(
  color: kFontColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontStyle: FontStyle.normal,
  fontSize: 25.0,
);

const kTodayHeading = TextStyle(
  color: kFontColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontStyle: FontStyle.normal,
  fontSize: 20.0,
);

const kWelcomeSubTextStyle = TextStyle(
  color: kBorderColor,
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
);

const kNext7DaysTextStyle = TextStyle(
  color: kBorderColor,
  fontSize: 17.0,
  fontWeight: FontWeight.w500,
);

const kTemperatureTextStyle = TextStyle(
  color: kFontColor,
  fontFamily: 'Poppins',
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kCelciusTextStyle = TextStyle(
  color: kBorderColor,
  fontSize: 25.0,
  fontWeight: FontWeight.w500,
);

const kNextWeatherTextStyle =  TextStyle(
  color: kBorderColor,
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
);

const kNextWeatherIcon =  TextStyle(
  color: kBorderColor,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);

const kNextTemperature = TextStyle(
  fontSize: 20,
  color: kBorderColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);

const kCountryTextStyle = TextStyle(
  color: kFontColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontStyle: FontStyle.normal,
  fontSize: 18.0,
);