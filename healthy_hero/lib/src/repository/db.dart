import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  final db = Firestore.instance;

  Stream<QuerySnapshot> initStream() {
    return db.collection('recetas').snapshots();
  }

  void readData(String id) async {
    DocumentSnapshot snapshot = await db.collection('recetas').document(id).get();
    print(snapshot.data['description']);
  }


}

DB db = DB();