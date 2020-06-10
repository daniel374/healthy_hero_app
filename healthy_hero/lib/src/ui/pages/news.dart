import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/news_bloc/new_bloc.dart';

class News extends StatefulWidget {
  @override
  NewsState createState() {
    return NewsState();
  }
}

class NewsState extends State<News> {
  String name;
  final _formKey = GlobalKey<FormState>();

  Card buildItem(DocumentSnapshot doc, NewsBloc bloc) {
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
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      
      child: Container(
        
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  (doc.data['name'] != "") ? doc.data['name'] : "nombre",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Image.network(
              (doc.data['image'] != null) ? doc.data['image'] : "image",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0,),
            Text(
              (doc.data['description'] != null) ? doc.data['description'] : "description",
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  
  }



  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista alimentos'),
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