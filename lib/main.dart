import 'package:flutter/material.dart';
import 'package:income_tax_calculator_nepal/utils/constants.dart';
import 'package:income_tax_calculator_nepal/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(),
    );
  }
}
