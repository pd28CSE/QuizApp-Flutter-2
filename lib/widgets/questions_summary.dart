import 'package:flutter/material.dart';

import 'package:quizeapp/widgets/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...summaryData.map((item) {
              return SummaryItem(item: item);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
