import 'package:about/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
        color: Colors.transparent,
      ),
      height: 800,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 20,
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
                  SizedBox(width: 20),
                  Text(
                    '삭제',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 40,
              ),
              child: Text(
                widget.book.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 140,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BookInfo(
                    name: '작가',
                    info: widget.book.author,
                  ),
                  BookInfo(
                    name: '장르',
                    info: widget.book.genre,
                  ),
                  BookInfo(
                    name: '플랫폼',
                    info: widget.book.platform,
                  ),
                  BookInfo(
                    name: '완독여부',
                    info: widget.book.isCompleted ? '완독' : '읽는중',
                  ),
                  BookInfo(
                    name: '등록일자',
                    info: widget.book.frstDt,
                  ),
                  BookInfo(
                    name: '수정일자',
                    info: widget.book.lstDt,
                  ),
                ],
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
                      fontSize: 36,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Text(
                    ' / ',
                    style: TextStyle(
                      fontSize: 36,
                      // color: Theme.of(context).primaryColor,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    (widget.book.completedNum == null)
                        ? ' - '
                        : '${widget.book.completedNum}',
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.black45,
                      // color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 170,
              child: (() {
                if (widget.book.readNum != null &&
                    widget.book.completedNum != null) {
                  return LinearPercentIndicator(
                    width: 170,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 1000,
                    percent: widget.book.readNum! / widget.book.completedNum!,
                    center: Text(
                      '${(widget.book.readNum! / widget.book.completedNum! * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    progressColor: Theme.of(context).primaryColor,
                  );
                } else if (widget.book.readNum != null &&
                    widget.book.completedNum == null) {
                  return LinearPercentIndicator(
                    width: 170,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 1000,
                    percent: 1,
                    progressColor: Theme.of(context).primaryColor,
                  );
                } else {
                  return LinearPercentIndicator(
                    width: 170,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 1000,
                    percent: 0,
                    progressColor: Theme.of(context).primaryColor,
                  );
                }
              })(),
            )
          ],
        ),
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
    required this.name,
    this.info,
  });

  final String name;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.black45,
          ),
        ),
        info == null
            ? const Text(
                '-',
              )
            : Text(info!),
      ],
    );
  }
}
