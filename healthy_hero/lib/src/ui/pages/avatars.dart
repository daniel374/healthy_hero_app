import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/avatars_bloc.dart/avatars_bloc.dart';

class Avatars extends StatefulWidget {
  @override
  AvatarsState createState() {
    return AvatarsState();
  }
}

class AvatarsState extends State<Avatars> {
  String name;
  final _formKey = GlobalKey<FormState>();

  Container buildItem(DocumentSnapshot doc, AvatarsBloc bloc) {
    /*return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'name: ${doc.data['name']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'todo: ${doc.data['todo']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );*/


    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        height: 300,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Center(
              child: Container(
                width: 260,
                child: Card(
                  child: Wrap(
                    children: <Widget>[
                      SizedBox(height: 10.0,),
                      Image.network(
                        (doc.data['image'] != null) ? doc.data['image'] : "image",
                        fit: BoxFit.cover,
                      ),
                      ListTile(

                      )
                    ],
                  )
                ),
              ),
            )
          ],
        ),
      );
  
  }



  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AvatarsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes saludables'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Textura_Con_Fondo.jpg"), 
            fit: BoxFit.cover)
        ),
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              
              StreamBuilder<String>(
                stream: bloc.outId,
                initialData: null,
                builder: (context, snapshot) {
                  return RaisedButton(
                    onPressed: snapshot.data != null ? bloc.readData : null,
                    child: Text('Read', style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                  );
                },
              ),
            ],
          ),*/
          StreamBuilder<QuerySnapshot>(
            stream: bloc.outFirestore,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.documents.map((doc) => buildItem(doc, bloc)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
      )
      
      
      
    );
  }


}