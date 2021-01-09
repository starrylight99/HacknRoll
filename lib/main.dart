import 'package:flutter/material.dart';
import 'package:focusv2/Welcome/welcome.dart';
import 'package:focusv2/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'focusv2',
        theme: ThemeData(
            primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
        home: WelcomePage());
  }
}
