import 'package:flutter/material.dart';
import 'utilities/constants.dart';
import 'screens/loading_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
