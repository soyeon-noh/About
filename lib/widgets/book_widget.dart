import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  String title, genre, date, platform, author;
  bool isCompleted;
  int completedNum, readNum;
  Book({
    super.key,
    required this.title,
    required this.author,
    required this.genre,
    required this.platform,
    required this.isCompleted,
    required this.completedNum,
    required this.readNum,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(author),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$genre | $platform | ${isCompleted ? '완독' : '읽는중'}',
                // style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$readNum / $completedNum 화',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
