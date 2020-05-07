import 'package:flutter/material.dart';


import 'package:healthy_hero/routes/routes.dart';
import 'package:healthy_hero/src/pages/alert_page.dart';
import 'package:healthy_hero/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {

        print( 'Ruta llamada: ${ settings.name } ');
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage(),
        
        );

      },
      home: MyHomePage(),
    );
  }
}
