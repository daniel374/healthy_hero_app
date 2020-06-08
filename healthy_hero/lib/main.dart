import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){

  runApp(new MaterialApp(
    title: "Camera App",
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  @override
  _LandindScreenState createState() => _LandindScreenState();
}

class _LandindScreenState extends State<LandingScreen> {

  File _imageFile;

  //final ImagePicker _picker = ImagePicker();

  _openGallery(BuildContext context) async {
    //final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      
      _imageFile = pickedFile;
    });
    Navigator.of(context).pop();
  }
  _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      
      _imageFile = pickedFile;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Seleccionar!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galeria"),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Camara"),
                onTap: (){
                  _openCamera(context);
                },
              )
            ],
          ),
        ),
      );
    });
  }


  Widget _decideImageView() {
    return (_imageFile == null) ? new Image.file(_imageFile,width: 400, height: 400) : Text('No hay imagen seleccionada!');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Container(
        child: Center( 
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(onPressed: (){
                _showChoiceDialog(context);
              },
              child: Text("Seleccione Imagen"),
            )
          ].where((child) => child != null).toList(),
          ),
        )
      ),
    );
  }
}