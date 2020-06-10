import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandindScreenState createState() => _LandindScreenState();
}

class _LandindScreenState extends State<LandingScreen> {

  File _imageFile;
  String recognizedText = "Loading ...";

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

  // Para MLkit
  _mlkitfunct(File _imageFile) async {
    final visionImage = FirebaseVisionImage.fromFile(_imageFile);
    final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);

    //reconoce emails
    // got the pattern from that SO answer: https://stackoverflow.com/questions/16800540/validate-email-address-in-dart
    String mailPattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regEx = RegExp(mailPattern);

    String mailAddress =
        "No se encontro mail en la foto! Por favor intenta de nuevo!";
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        /*if (regEx.hasMatch(line.text)) {
          mailAddress = line.text;
        }*/
        mailAddress = line.text;
      }
    }

    if (this.mounted) {
      setState(() {
        recognizedText = mailAddress;
      });
    }
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
    if (_imageFile != null) {
      _mlkitfunct(_imageFile);
      return Image.file(_imageFile,width: 400, height: 400);
    }else{
      return Text('No hay imagen seleccionada!');
    }
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
              //child: Text("Seleccione Imagen"),
              child: Text(
                  recognizedText,
                  style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ].where((child) => child != null).toList(),
          ),
        )
      ),
    );
  }
}