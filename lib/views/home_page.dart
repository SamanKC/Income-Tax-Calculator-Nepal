import 'package:flutter/material.dart';

import 'package:income_tax_calculator_nepal/utils/constants.dart';
import 'package:income_tax_calculator_nepal/views/main_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      body: const MainContainer(),
    );
  }
}
