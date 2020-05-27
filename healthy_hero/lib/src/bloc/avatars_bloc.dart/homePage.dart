import 'package:flutter/material.dart';

import 'receta.dart';
import 'recetaBloc.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RecetaBloc _recetaBloc = RecetaBloc();

  
  @override
  void dispose() {
    super.dispose();
    _recetaBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Recetas"),
      ),
      body: Container(
        child: StreamBuilder<List<Receta>>(
          stream: _recetaBloc.empleadoListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Receta>> snapshot) { 
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].nombre}.",
                          style: TextStyle(fontSize: 20.0)
                        )
                      )
                    ],
                  )
                );
              }
              );
           },
        ),
      ),
    );
  }
}