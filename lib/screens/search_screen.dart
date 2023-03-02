import 'package:about/models/book_model.dart';
import 'package:about/screens/modal_screen.dart';
import 'package:about/services/api_service.dart';
import 'package:about/widgets/book_widget.dart';
import 'package:about/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final pink = const Color(0xFFFACCCC);

  final grey = const Color(0xFFF2F2F7);

  var _selectedValue = '제목';
  final _valueList = ['제목', '작가', '장르', '플랫폼'];
  final Future<List<BookModel>> books = ApiService.getUsersBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
            assetImage: const AssetImage('assets/images/gradient2.png'),
            paddingTop: 40,
            paddingBottom: 20,
            insideWidget: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Stack(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: pink,
                            focusedBorder: _border(pink),
                            border: _border(grey),
                            enabledBorder: _border(grey),
                            hintText: '검색',
                            contentPadding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              right: 20,
                              left: 100,
                            ),
                            suffixIcon: const Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                        ),
                      ),
                      Positioned(
                        left: 20,
                        child: DropdownButton(
                          focusColor: Colors.white,
                          elevation: 0,
                          dropdownColor:
                              const Color.fromARGB(255, 255, 255, 255),

                          underline: const SizedBox.shrink(), //userline지우기
                          value: _selectedValue,
                          items: _valueList.map((value) {
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
                              _selectedValue = value!;
                            });
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
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

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
