import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/repository/db.dart';
import 'package:rxdart/rxdart.dart';

class RecipeBloc implements BlocBase {

  RecipeBloc(){
    // instance stream
    db.initStream().listen((data) => _inFirestore.add(data) );
  }

  String id;

  /// Refer to https://github.com/RobertBrunhage/Youtube-Tutorials/issues/3 to see why we use BehaviorSubject instead.
  final _idController = BehaviorSubject<String>();
  Stream<String> get outId => _idController.stream;
  Sink<String> get _inId => _idController.sink;

  final _firestoreController = BehaviorSubject<QuerySnapshot>();
  Stream<QuerySnapshot> get outFirestore => _firestoreController.stream;
  Sink<QuerySnapshot> get _inFirestore => _firestoreController.sink;

  void readData() async {
    db.readData(id);
  }

  void updateData(DocumentSnapshot doc) {
    db.updateData(doc);
  }

  void deleteData(DocumentSnapshot doc) async {
    db.deleteData(doc);
    id = null;
    _inId.add(null);
  }

  void createData(String name) async {
    String id = await db.createData(name);
    this.id = id;
    _inId.add(this.id);
  }

  @override
  void dispose() {
    _firestoreController.close();
    _idController.close();
  }
}