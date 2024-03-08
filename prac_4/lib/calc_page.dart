// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:prac_4/calcu.dart';

class Area extends StatefulWidget {
  Area({super.key});

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
  TextEditingController len = TextEditingController();

  TextEditingController breadth = TextEditingController();
  late double value;
  Calculations calc = Calculations();
  void showAns(double ans) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('area = $ans:'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('calculate the area of a rectangle'),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: len,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'enter length'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: breadth,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'enter breadth'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: () {
                    double lenDouble = double.parse(len.text);
                    double breadthD = double.parse(breadth.text);
                    value = calc.areaRect(lenDouble, breadthD);
                    showAns(value);
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
