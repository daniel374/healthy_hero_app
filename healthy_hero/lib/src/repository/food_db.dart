import 'package:cloud_firestore/cloud_firestore.dart';

class Foodsdb {
  final foodsdb = Firestore.instance;

  Stream<QuerySnapshot> initStream() {
    return foodsdb.collection('avatars').snapshots();
  }

  void readData(String id) async {
    DocumentSnapshot snapshot = await foodsdb.collection('avatars').document(id).get();
    print(snapshot.data['name']);
  }


}

Foodsdb foodsdb = Foodsdb();