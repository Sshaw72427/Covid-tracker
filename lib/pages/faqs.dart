import 'package:covid_tracker/dataSource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: ((context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.questionAnswers[index]['question'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  DataSource.questionAnswers[index]['answer'],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
