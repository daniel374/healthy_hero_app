import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/news_bloc/new_bloc.dart';
import 'package:healthy_hero/src/ui/pages/news.dart';



class NewsPage extends StatelessWidget {


  //MaterialColor colorCustom = MaterialColor(0xffEFB810, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noticias y hábitos saludables',
      theme: ThemeData(
        
        primarySwatch: Colors.yellow,
      ),/*appBar: AppBar(
        title: Text("Recetas")
      ),*/
      home: BlocProvider(
        bloc: NewsBloc(),
        child: News(),
      ),
    );
  }
}