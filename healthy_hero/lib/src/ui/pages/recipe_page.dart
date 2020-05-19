import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/recipes_bloc/recipe_bloc.dart';
import 'package:healthy_hero/src/ui/pages/recipe.dart';

class RecipePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recetas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: RecipeBloc(),
        child: FirestoreCRUDPage(),
      ),
    );
  }
}