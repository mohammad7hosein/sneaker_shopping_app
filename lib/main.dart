import 'package:flutter/material.dart';
import 'package:sneaker_shopping_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xffaaa6d6), // purple
          cardColor: const Color(0xff1a191c), // black
          backgroundColor: const Color(0xfff4f5fc),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xfff68a0a),), // orange
          ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

