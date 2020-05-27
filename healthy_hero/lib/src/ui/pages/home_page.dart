import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_hero/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:healthy_hero/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:healthy_hero/src/util/styleColor.dart';



class MyHomePage extends StatelessWidget {
  
  final String name;
  Color c = const Color(0xFF42A5F5);

  MyHomePage({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HealthyHero"),
        backgroundColor: Color(0xffEFB810),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          },
          )
        ],
      ),
      drawer: MenuLateral(),
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
              fontSize: 15,
            ),),
            ),
          ],
        ),
      ),
    );
  }
}


class MenuLateral extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("HealthyHero"), 
            accountEmail: Text("dannylayton374@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pancakes_avena.jpeg"),
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Ink(
            color: Color(StyleColor.hexColor('#EFB810')),
            child: ListTile(
            title: Text("home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),),
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          ),
          ListTile(
            title: Text("recetas"),
            onTap: () {
              Navigator.pushNamed(context, "/recipes");
            },
          ),
          ListTile(
            title: Text("dietas"),
            onTap: () {
              Navigator.pushNamed(context, "/dietas");
            },
          ),
          ListTile(
            title: Text("noticias"),
            onTap: () {
              Navigator.pushNamed(context, "/news");
            },
          ),
          ListTile(
            title: Text("perfil"),
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
          ),
          ListTile(
            title: Text("avatars"),
            onTap: () {
              Navigator.pushNamed(context, "/avatars");
            },
          ),
          ListTile(
            title: Text("App Recetas"),
            onTap: () {
              Navigator.pushNamed(context, "/apprecetas");
            },
          ),
        ]
      ),
    );
  }
}