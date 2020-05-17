import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_hero/src/bloc/authentication_bloc.dart';
import 'package:healthy_hero/src/bloc/authentication_event.dart';

class HomeScreen extends StatelessWidget {

  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.cyan[200],),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(child: Text('Bienvenido $name!', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 24,
            ),),
            ),
          ],
        ),
      ), 
    );
  }
}