import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HealthyHero"),
      ),
      drawer: MenuLateral(),
      body: Center(
        child: Text("home"),
      )
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
            accountName: Text("Healthy_hero"), 
            accountEmail: Text("dannylayton374@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/src/resources/images/sami.jpeg"),
                fit: BoxFit.cover, 
              ),
            ),
          ),
          Ink(
            color: Colors.indigo,
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
            title: Text("login"),
            onTap: () {
              Navigator.pushNamed(context, "/login");
            },
          ),
          ListTile(
            title: Text("registro"),
            onTap: () {
              // Navigator.pushNamed(context, "/register");
            },
          )
        ]
      ),
    );
  }
}