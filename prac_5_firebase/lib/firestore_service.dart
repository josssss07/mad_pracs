import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String note) {
    return notes.add({'note': note, 'time': Timestamp.now()});
  }

  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = notes.orderBy('time', descending: true).snapshots();
    return notesStream;
  }

  Future<void> updateNote(String id, String newNote){
    return notes.doc(id).update({
      'note': newNote,
      'time': DateTime.now()
    }); 
  }

  Future<void> delete(String id){
    return notes.doc(id).delete();
  }

  
}
