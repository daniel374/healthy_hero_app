import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/repository/new_db.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc implements BlocBase {

  NewsBloc(){
    // instance stream
    newsdb.initStream().listen((data) => _inFirestore.add(data) );
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
    newsdb.readData(id);
  }

  @override
  void dispose() {
    _firestoreController.close();
    _idController.close();
  }
}