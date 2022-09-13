import 'package:covid_tracker/dataSource.dart';
import 'package:covid_tracker/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: primaryBlack,
        secondaryHeaderColor: primaryBlack,
      ),
      home: HomePage(),
    ),
  );
}
