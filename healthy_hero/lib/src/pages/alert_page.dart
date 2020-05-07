import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alerta!"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context))
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Contenido de la caja de la alerta'),
            FlutterLogo( size: 100.0,)
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text('cancelar'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
        ],
      )
    );


  }
}
