import 'package:about/models/book_model.dart';
import 'package:about/services/api_service.dart';
import 'package:about/widgets/book_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<BookModel>> books = ApiService.getUsersBooks();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     '검색',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     '서재',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     '메뉴',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
            ),
            color: Colors.black,
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.book),
          //   color: Colors.black,
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
            color: Colors.black,
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.home_rounded,
                size: 30,
              ),
              Icon(
                Icons.menu_book_rounded,
                size: 30,
              ),
              Icon(
                Icons.create_rounded,
                size: 30,
              )
            ],
          ),
        ),
        // elevation: 0,
        // backgroundColor: Colors.white,
        // selectedItemColor: Colors.black,
        // selectedIconTheme: const IconThemeData(
        //   color: Colors.black,
        // ),
        // unselectedIconTheme: const IconThemeData(
        //   color: Colors.black54,
        // ),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // items: const [
        //   BottomNavigationBarItem(
        //     icon: Icon(
        //       Icons.home_rounded,
        //     ),
        //     label: '홈',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(
        //       Icons.menu_book_rounded,
        //     ),
        //     label: '서재',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(
        //       Icons.create,
        //     ),
        //     label: '작성',
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Column(
            children: const [
              Text(
                '책씹어먹는',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '해파리',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(''),
                Text(
                  '정렬',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.right,
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
                      date: book.date,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 30,
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
