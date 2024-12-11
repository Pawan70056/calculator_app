// import 'package:assignment/pages/grid_view_page.dart';
import 'package:calculator/views/calculator_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
