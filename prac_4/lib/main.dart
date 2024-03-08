//bottom nav bar and calculator stuff

import 'package:flutter/material.dart';
import 'package:prac_4/nav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: BottomNavBar(),
      home: BottomNavBar(),
    );
  }
}
