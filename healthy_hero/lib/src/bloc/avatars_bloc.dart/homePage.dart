import 'package:flutter/material.dart';
import 'package:healthy_hero/src/bloc/avatars_bloc.dart/receta.dart';
import 'package:healthy_hero/src/bloc/avatars_bloc.dart/recetaBloc.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RecetaBloc _recetaBloc = RecetaBloc();

  
  @override
  void dispose() {
    super.dispose();
    _recetaBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Recetas"),
      ),
      body: Container(
        
      ),
    );
  }
}