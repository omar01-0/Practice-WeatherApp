import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:geolocator/geolocator.dart';



class LocationButton extends StatelessWidget {

  LocationButton({this.onpressed, this.locationIcon});

  Function onpressed;
  Icon locationIcon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 6.0,
      padding: EdgeInsets.all(8.0),
      fillColor: kButtonsColor,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      disabledElevation: 0.0,
      child: locationIcon,
      onPressed: onpressed,
    );
  }
}
