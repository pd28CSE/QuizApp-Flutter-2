import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> item;

  const SummaryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: item['correct_answer'] as String ==
                    item['user_answer'] as String
                ? Colors.green
                : Colors.red,
            child: Text('${(item['question_index'] as int) + 1}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item['question_text'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                ),
                Text(
                  item['user_answer'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 168, 114, 230),
                  ),
                ),
                Text(
                  item['correct_answer'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 84, 117, 226),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
