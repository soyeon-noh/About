import 'package:about/models/book_model.dart';
import 'package:about/services/api_service.dart';
import 'package:about/widgets/book_widget.dart';
import 'package:about/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final pink = const Color(0xFFFACCCC);
  final grey = const Color(0xFFF2F2F7);
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: pink,
                      focusedBorder: _border(pink),
                      border: _border(grey),
                      enabledBorder: _border(grey),
                      hintText: '제목, 작가, 태그 검색',
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
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
                    return Book(
                      title: book.title,
                      genre: book.genre,
                      author: book.author,
                      platform: book.platform,
                      isCompleted: book.isCompleted,
                      completedNum: book.completedNum,
                      readNum: book.readNum,
                      frstDt: book.frstDt,
                      lstDt: book.lstDt,
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
