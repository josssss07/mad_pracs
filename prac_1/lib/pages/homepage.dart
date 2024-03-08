// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showStuff() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('tile pressed:'),
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
      appBar: AppBar(
        title: Text('basic list view'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('tile 1'),
            leading: Icon(Icons.earbuds_battery),
            onTap: () {
              showStuff();
            },
          ),
          ListTile(
            title: Text('tile 2'),
            leading: Icon(Icons.earbuds_battery),
            onTap: () {
              showStuff();
            },
          ),
          ListTile(
            title: Text('tile 3'),
            leading: Icon(Icons.earbuds_battery),
            onTap: () {
              showStuff();
            },
          ),
          ListTile(
            title: Text('tile 4'),
            leading: Icon(Icons.earbuds_battery),
            onTap: () {
              showStuff();
            },
          ),
        ],
      ),
    );
  }
}
