import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/foods_bloc/food_bloc.dart';
import 'package:healthy_hero/src/ui/pages/foods.dart';



class FoodsPage extends StatelessWidget {


  //MaterialColor colorCustom = MaterialColor(0xffEFB810, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista alimentos',
      theme: ThemeData(
        
        primarySwatch: Colors.yellow,
      ),/*appBar: AppBar(
        title: Text("Recetas")
      ),*/
      home: BlocProvider(
        bloc: FoodsBloc(),
        child: Foods(),
      ),
    );
  }
}