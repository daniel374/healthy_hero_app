import 'package:cloud_firestore/cloud_firestore.dart';

class Foodsdb {
  final foodsdb = Firestore.instance;

  Stream<QuerySnapshot> initStream() {
    return foodsdb.collection('alimentos').snapshots();
  }

  void readData(String id) async {
    DocumentSnapshot snapshot = await foodsdb.collection('alimentos').document(id).get();
    print(snapshot.data['namefood']);
  }


}

Foodsdb foodsdb = Foodsdb();