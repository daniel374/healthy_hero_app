import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/avatars_bloc.dart/avatars_bloc.dart';

import 'avatars.dart';


class AvatarsPage extends StatelessWidget {


  //MaterialColor colorCustom = MaterialColor(0xffEFB810, color);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avatars',
      theme: ThemeData(
        
        primarySwatch: Colors.yellow,
      ),/*appBar: AppBar(
        title: Text("Recetas")
      ),*/
      home: BlocProvider(
        bloc: AvatarsBloc(),
        child: Avatars(),
      ),
    );
  }
}