import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("perfil"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('usuarios').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => 
              _buildListItem(context, snapshot.data.documents[index]),
          );
        }
      )
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              document['email'],
              style: Theme.of(context).textTheme.headline5,
            )
          ),
          Expanded(
            child: Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['hijos'][0]['nombreHijo'].toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
          ),
        ]  
      ),
      );
    
  }
}