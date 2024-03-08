// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prac_5_firebase/firestore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //vars:
  TextEditingController textCon = TextEditingController();
  Firestore fire = Firestore();
  void openNotes() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: textCon,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    fire.addNote(textCon.text);
                    textCon.clear();
                    Navigator.pop(context);
                  },
                  child: Text('add'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firestore test'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNotes();
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fire.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notes = snapshot.data!.docs;

            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = notes[index];

                  String docId = doc.id;

                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
                  String notesText = data['note'];

                  return ListTile(
                    title: Text(notesText),
                  );
                });
          } else {
            return Text('no new notes :)');
          }
        },
      ),
    );
  }
}
