// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'homepage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AutofillGroup(
            child: Column(
              children: <Widget>[
                Text('enter the username'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: username,
                    autofillHints: [AutofillHints.username],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'enter your username',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('enter the password'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: password,
                    autofillHints: [AutofillHints.password],
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'enter your password',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String usernameval = username.text;
                    String passwordval = password.text;
                    if (!usernameval.isEmpty && !passwordval.isEmpty) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => Homepage()));
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
