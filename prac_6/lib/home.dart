// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double pi = 3.141516;
  double degree = 0;
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animations practice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
                visible: visible,
                child: Transform(
                  transform: Matrix4.rotationZ(pi * degree / 180),
                  child: SizedBox(
                    height: 70,
                    width: 100,
                    child: Icon(Icons.blur_circular_rounded),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            visible = visible;
            degree += 30;
          });
        },
        child: Text('hide'),
      ),
    );
  }
}
