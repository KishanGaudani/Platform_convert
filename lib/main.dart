import 'package:flutter/material.dart';
import 'views/screens/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const HomePage(),
      },
    ),
  );
}
