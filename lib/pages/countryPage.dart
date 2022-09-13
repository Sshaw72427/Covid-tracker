import 'dart:convert';

import 'package:covid_tracker/dataSource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
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
    // TODO: implement initState
    fetchCoutryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Status'),
        backgroundColor: primaryBlack,
      ),
      body: countryData == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    )
                  ]),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              countryData![index]['country'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countryData![index]['countryInfo']['flag'],
                              height: 50,
                              width: 60,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'CONFIRMED:' +
                                    countryData![index]['cases'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                            Text(
                                'ACTIVE:' +
                                    countryData![index]['active'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            Text(
                                'RECOVERED:' +
                                    countryData![index]['recovered'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                            Text(
                                'DEATHS:' +
                                    countryData![index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800])),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData!.length,
            ),
    );
    //
  }
}
