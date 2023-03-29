import 'package:about/screens/create_screen.dart';
import 'package:about/screens/home_screen.dart';
import 'package:about/screens/search_screen.dart';
import 'package:about/screens/user_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key});

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const SearchScreen(),
    CreateScreen(),
    // const ChartScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4, // chart를 추가하려면 5로 변경
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true, // body 위에 appbar
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.search_rounded,
        //       ),
        //       color: Colors.white,
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.menu_rounded),
        //       color: Colors.white,
        //     ),
        //     const SizedBox(
        //       width: 15,
        //     )
        //   ],
        // ),
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            // <Widget>넣는거 이해안됨...
            Tab(
              icon: Icon(
                Icons.home_rounded,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.create_rounded,
                size: 30,
              ),
            ),
            // Tab(
            //   icon: Icon(
            //     Icons.bar_chart_rounded,
            //     size: 30,
            //   ),
            // ),
            Tab(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ],
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black87,
        ),
        body: TabBarView(
          children: _widgetOptions,
        ),
      ),
    );
  }
}
