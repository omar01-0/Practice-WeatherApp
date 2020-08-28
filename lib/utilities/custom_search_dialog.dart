import 'package:flutter/material.dart';
import 'constants.dart';

class CustomSearchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 6,
      backgroundColor: kFontColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: dialogContent(context),
    );
  }
}

dialogContent(context) {
  return Container(
    constraints: BoxConstraints.tightFor(
      width: double.infinity,
      height: 150,
    ),
    padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      color: kFontColor,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextField(
          cursorColor: kPrimaryColor,
          style: kSearchTextField,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kBorderColor),
                borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8.0),
            labelText: "Enter Name of The City.",
            labelStyle: kWelcomeSubTextStyle,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          keyboardType: TextInputType.text,
          showCursor: true,
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          padding: EdgeInsets.all(8.0),
          elevation: 6,
          color: kFontColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: kBorderColor,
            ),
          ),
          child: Text(
            'Search',
            style: kSearchButton,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
