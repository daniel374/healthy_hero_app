import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthy_hero/src/repository/db_avatars.dart';
import 'package:rxdart/rxdart.dart';

import '../../../bloc_provider.dart';

class AvatarsBloc implements BlocBase {

  AvatarsBloc(){
    dbAvatars.initStream().listen((data) => _inFirestore.add(data));
  }

  String id;

  final _idController = BehaviorSubject<String>();
  Stream<String> get outId => _idController.stream;

  final _firestoreController = BehaviorSubject<QuerySnapshot>();
  Stream<QuerySnapshot> get outFirestore => _firestoreController.stream;
  Sink<QuerySnapshot> get _inFirestore => _firestoreController.sink;

  void readData() async {
    dbAvatars.readAvatar(id);
  }

  @override
  void dispose() {
    _firestoreController.close();
    _idController.close();
  }

}