import 'package:about/models/book_model.dart';
import 'package:flutter/material.dart';

class ModalScreen extends StatefulWidget {
  final BookModel book;
  const ModalScreen({
    super.key,
    required this.book,
  });

  @override
  State<ModalScreen> createState() => _ModalScreenState();
}

class _ModalScreenState extends State<ModalScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      height: 800,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 20,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '수정',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '삭제',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.book.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              '${widget.book.author}',
              style: const TextStyle(
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${widget.book.genre} | ${widget.book.platform} | ${widget.book.isCompleted ? '완독' : '읽는중'}',
              style: const TextStyle(
                color: Colors.black45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.book.readNum}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Text(
                    ' / ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    (widget.book.completedNum == null)
                        ? '-'
                        : '${widget.book.completedNum} ',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
