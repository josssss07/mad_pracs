import 'dart:js';

import 'package:flutter/material.dart';

class BMIPage extends StatelessWidget {
  const BMIPage({super.key});

  void showbMI (double bmi){
    showDialog(context: context, builder: (context){
      AlertDialog(
        actions: [],
      )
    })

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('bmi'),
        ),
      ),
    );
  }
}