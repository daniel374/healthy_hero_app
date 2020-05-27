//1. imports
//2. Lista de Avatars
//3. Stream Controller
//4. Stream Sink Getters
//5. Constructors
//6. funciones principales
// 7. dispose

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthy_hero/src/bloc/avatars_bloc.dart/receta.dart';


class RecetaBloc {
  //Conectar con Firebase
  final recetas = Firestore.instance.collection('recetas');

  List<Receta> _recetasList = [
    Receta(1, "Pollo con arroz", "el pollo esta frito con salsa de Cocaola", 100),
    Receta(1, "Carne asada", "carne frita", 100),
    Receta(1, "salsa pasta ", "saalsa de pasta", 100),
    Receta(1, "arroz con queso", "Queso con arroz ", 100),

  ];
  

  //Stream controller
  final _recetaListStreamController = StreamController<List<Receta>>();//espera lista de recetas

  final _recetaSalarioIncrementStreamController = StreamController<Receta>();
  final _recetaSalarioDecrementStreamController = StreamController<Receta>();

  // Getters: Streams y sinks
  Stream <List<Receta>> get recetaListStream => _recetaListStreamController.stream;
  StreamSink <List<Receta>> get recetaListSink => _recetaListStreamController.sink;

  StreamSink <Receta> get recetaSalarioIncrement => _recetaSalarioIncrementStreamController.sink;

  StreamSink <Receta> get recetaSalarioDecrement => _recetaSalarioDecrementStreamController.sink;

  // Constructor
  RecetaBloc () {
    //db.initStream().listen((data) => _inFirestore.add(data) );
    _recetaListStreamController.add(_recetasList);
    _recetaSalarioIncrementStreamController.stream.listen(_incrementSalario);
    _recetaSalarioIncrementStreamController.stream.listen(_decrementSalario);
  }

  //funciones principales
  _incrementSalario(Receta receta) {
    int salarioActual = receta.likes;
    int salarioIncrement = 1;
    
    _recetasList[receta.id - 1].likes = salarioActual + salarioIncrement;
    recetaListSink.add(_recetasList);
  }

  _decrementSalario(Receta receta) {
    int salarioActual = receta.likes;
    int salarioDecrement = 1;

    _recetasList[receta.id - 1].likes = salarioActual - salarioDecrement;
    recetaListSink.add(_recetasList);
  }

  // dispose
  void dispose() {
    _recetaSalarioIncrementStreamController.close();
    _recetaSalarioDecrementStreamController.close();
    _recetaListStreamController.close();
  }

}