import 'dart:convert';

import 'package:covid_tracker/dataSource.dart';
import 'package:covid_tracker/pages/countryPage.dart';
import 'package:covid_tracker/panels/infoPanel.dart';
import 'package:covid_tracker/panels/mostAffetedCountry.dart';
import 'package:covid_tracker/panels/worldwidePanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://disease.sh/v3/covid-19/all';
  Map? worldData;
  fetchWroldData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  String uri = 'https://disease.sh/v3/covid-19/countries';
  List? countryData;
  fetchCoutryData() async {
    http.Response response = await http.get(
      Uri.parse(uri),
    );
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWroldData();
    fetchCoutryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("COVID-19 TRACKER"),
        backgroundColor: primaryBlack,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Worldwide',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'Regional',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? const CircularProgressIndicator()
                : WorldwidePanel(worldData: worldData),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Most Affected Countries',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(countryData: countryData),
            InfoPanel(),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'WE ARE TOGETHER IN THIS FIGHT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
