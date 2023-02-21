import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  String title, frstDt, lstDt;
  String? genre, platform, author;
  bool isCompleted;
  int? completedNum, readNum;
  Book({
    super.key,
    required this.title,
    this.author,
    this.genre,
    this.platform,
    required this.isCompleted,
    this.completedNum,
    this.readNum,
    required this.frstDt,
    required this.lstDt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCompleted
            ? const Color.fromARGB(20, 0, 0, 0)
            : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    author ?? '',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    '$genre | $platform | ${isCompleted ? '완독' : '읽는중'}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$readNum / ${completedNum ?? '-'} 화',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,

                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    lstDt,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
