import 'dart:ui';

import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map? worldData;

  const WorldwidePanel({super.key, required this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            panelColor: Colors.red[100],
            textColor: Colors.red,
            title: 'CONFIRMED',
            count: worldData!['cases'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            title: 'ACTIVE',
            count: worldData!['active'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.green[100],
            textColor: Colors.green,
            title: 'RECOVERED',
            count: worldData!['recovered'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.grey[400],
            textColor: Colors.grey[800],
            title: 'DEATHS',
            count: worldData!['deaths'].toString(),
          )
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color? panelColor;
  final Color? textColor;
  final String title;
  final String count;

  const StatusPanel(
      {super.key,
      required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: width / 2,
      margin: EdgeInsets.all(5),
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          )
        ],
      ),
    );
  }
}
