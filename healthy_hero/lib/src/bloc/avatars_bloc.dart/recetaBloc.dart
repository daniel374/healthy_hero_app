//1. imports
//2. Lista de Avatars
//3. Stream Controller
//4. Stream Sink Getters
//5. Constructors
//6. funciones principales
// 7. dispose

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'receta.dart';

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
  final _empleadoListStreamController = StreamController<List<Receta>>();//espera lista de recetas

  final _empleadoSalarioIncrementStreamController = StreamController<Receta>();
  final _empleadoSalarioDecrementStreamController = StreamController<Receta>();

  // Getters: Streams y sinks
  Stream <List<Receta>> get empleadoListStream => _empleadoListStreamController.stream;
  StreamSink <List<Receta>> get empleadoListSink => _empleadoListStreamController.sink;

  StreamSink <Receta> get empleadoSalarioIncrement => _empleadoSalarioIncrementStreamController.sink;

  StreamSink <Receta> get empleadoSalarioDecrement => _empleadoSalarioDecrementStreamController.sink;

  // Constructor
  RecetaBloc () {
    //db.initStream().listen((data) => _inFirestore.add(data) );
    _empleadoListStreamController.add(_recetasList);
    _empleadoSalarioIncrementStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioIncrementStreamController.stream.listen(_decrementSalario);
  }

  //funciones principales
  _incrementSalario(Receta receta) {
    int salarioActual = receta.likes;
    int salarioIncrement = 1;
    
    _recetasList[receta.id - 1].likes = salarioActual + salarioIncrement;
    empleadoListSink.add(_recetasList);
  }

  _decrementSalario(Receta receta) {
    int salarioActual = receta.likes;
    int salarioDecrement = 1;

    _recetasList[receta.id - 1].likes = salarioActual - salarioDecrement;
    empleadoListSink.add(_recetasList);
  }

  // dispose
  void dispose() {
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioDecrementStreamController.close();
    _empleadoListStreamController.close();
  }

}