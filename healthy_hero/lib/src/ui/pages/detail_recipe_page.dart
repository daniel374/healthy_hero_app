import 'package:flutter/material.dart';

class DetailRecipe extends StatelessWidget {
  
  final String fruit;

  DetailRecipe(this.fruit);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalles recetas"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Recibimos datos: "),
            Text(
              fruit,
              style:  TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

}