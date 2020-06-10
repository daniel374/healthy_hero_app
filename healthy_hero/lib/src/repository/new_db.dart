import 'package:cloud_firestore/cloud_firestore.dart';

class Newsdb {
  final newsdb = Firestore.instance;

  Stream<QuerySnapshot> initStream() {
    return newsdb.collection('news').snapshots();
  }

  void readData(String id) async {
    DocumentSnapshot snapshot = await newsdb.collection('news').document(id).get();
    print(snapshot.data['name']);
  }


}

Newsdb newsdb = Newsdb();