import 'package:bmiaplication/BMI/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.black,
          fontFamily: "raber_21"),
      debugShowCheckedModeBanner: false,
      home: MainPageBMI(),
    );
  }
}
