import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DbAvatars {

  final dbAvatars = Firestore.instance;

  Stream<QuerySnapshot> initStream() {
    return dbAvatars.collection('avatars').snapshots();
  }

  void readAvatar(String id) async {
    DocumentSnapshot snapshot = await dbAvatars.collection('avatars').document(id).get();
    print(snapshot.data['femenino']);
  }
}

DbAvatars dbAvatars = DbAvatars();