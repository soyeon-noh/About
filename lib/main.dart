import 'package:about/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Noto',
        primaryColor: const Color(0xff6f64d7),
      ),
      home: BottomNavigator(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/create': (context) => const CreateScreen(),
      //   '/chart': (context) => const ChartScreen(),
      // },
    ),
  );
}
