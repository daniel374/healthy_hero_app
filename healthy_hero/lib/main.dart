import 'package:flutter/material.dart';

import 'src/bloc/avatars_bloc.dart/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app Recetas",
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}