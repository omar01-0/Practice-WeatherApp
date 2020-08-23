import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherCard extends StatelessWidget {

  WeatherCard({this.icon, this.value});

  final FaIcon icon;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: icon,
          decoration: BoxDecoration(
            color: kButtonsColor.withOpacity(0.6),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          constraints: BoxConstraints.tightFor(
            width: 40,
            height: 40,
          ),
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            value,
            style: kWelcomeSubTextStyle,
          ),
        ),
      ],
    );
  }
}
