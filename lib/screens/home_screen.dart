import 'package:about/models/book_model.dart';
import 'package:about/screens/modal_screen.dart';
import 'package:about/services/api_service.dart';
import 'package:about/widgets/book_widget.dart';
import 'package:about/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final condition = ['최신순', '전체'];
  final _dateValueList = ['최신순', '등록순'];
  final _readValueList = ['전체', '읽는중', '완독'];

  var _dateSelectedValue = '최신순';
  var _readSelectedValue = '전체';

  @override
  Widget build(BuildContext context) {
    final Future<List<BookModel>> books = ApiService.getUsersBooks(
      condition: condition,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
            assetImage: const AssetImage('assets/images/gradient1.png'),
            paddingTop: 60,
            paddingBottom: 30,
            insideWidget: Column(
              children: const [
                Text(
                  '책씹어먹는',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '해파리',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40), // 38?
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DropdownButton(
                      elevation: 0,
                      dropdownColor: const Color.fromRGBO(235, 235, 235, 1),
                      underline: const SizedBox.shrink(), //userline지우기
                      value: _dateSelectedValue,
                      items: _dateValueList.map((value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _dateSelectedValue = value!;
                          condition.first = value;
                        });

                        print(condition);
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    DropdownButton(
                      elevation: 0,
                      dropdownColor: const Color.fromRGBO(235, 235, 235, 1),

                      underline: const SizedBox.shrink(), //userline지우기
                      value: _readSelectedValue,
                      items: _readValueList.map((value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _readSelectedValue = value!;
                          condition.last = value;
                          print(condition);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FutureBuilder(
            future: books,
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.separated(
                  itemCount: snapshot.data?.length ?? 0, //여기 수정필요
                  itemBuilder: (context, index) {
                    var book = snapshot.data![index];

                    print(index);
                    return GestureDetector(
                      onTap: () {
                        // modal창 띄우기
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return ModalScreen(book: book);
                          },
                        );
                      },
                      child: Book(
                        title: book.title,
                        genre: book.genre,
                        author: book.author,
                        platform: book.platform,
                        isCompleted: book.isCompleted,
                        completedNum: book.completedNum,
                        readNum: book.readNum,
                        frstDt: book.frstDt,
                        lstDt: book.lstDt,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black26)),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
