import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("noticias"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1()
        ]
      ),
    );
  }

  Widget _cardTipo1() {
    
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.ac_unit, color: Colors.blue,),
            title: Text("Soy una receta nueva y muy rica"),
            subtitle: Text('Esta receta es muy nutritiva y es un borrador de las cards ó tarjetas que mostraran            toda la información relacionada a los detalles e ingredientes de las recetas.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  
  }

}



