import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List? countryData;

  const MostAffectedPanel({super.key, required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Image.network(
                  countryData![index]['countryInfo']['flag'],
                  height: 28,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(countryData![index]['country'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Deaths:' + countryData![index]['deaths'].toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
