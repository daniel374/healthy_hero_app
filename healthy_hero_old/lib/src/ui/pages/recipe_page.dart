import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/recipes_bloc/recipe_bloc.dart';
import 'package:healthy_hero/src/ui/pages/recipe.dart';


class RecipePage extends StatelessWidget {


  //MaterialColor colorCustom = MaterialColor(0xffEFB810, color);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.yellow,
      ),/*appBar: AppBar(
        title: Text("Recetas")
      ),*/
      home: BlocProvider(
        bloc: RecipeBloc(),
        child: Recipes(),
      ),
    );
  }
}