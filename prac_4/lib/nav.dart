// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:prac_4/bmi.dart';
import 'package:prac_4/calc_page.dart';
import 'package:prac_4/homepage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  List<Widget> pages = [
    Area(),
    BMIPage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(index),
      bottomNavigationBar: GNav(
        gap: 8,
        onTabChange: (index) {
          print(index);
        },
        backgroundColor: Colors.pink,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.pinkAccent,
        padding: EdgeInsets.all(16),
        tabs: [
          GButton(
            icon: Icons.calculate,
            text: 'Area',
            onPressed: () {
              setState(() {
                index = 0;
              });
            },
          ),
          GButton(
            icon: Icons.person,
            text: 'BMI',
            onPressed: () {
              setState(() {
                index = 1;
              });
            },
          ),
          GButton(
            icon: Icons.home,
            text: 'home',
            onPressed: () {
              setState(() {
                index = 2;
              });
            },
          )
        ],
        selectedIndex: index,
      ),
    );
  }
}
