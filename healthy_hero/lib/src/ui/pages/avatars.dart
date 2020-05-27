import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/avatars_bloc.dart/avatars_bloc.dart';


class Avatars extends StatefulWidget {

  //final List<String> fruits = ["Apples", "Oranges", "Bananas"];

  //get itemCount => fruits.length;

  @override
  AvatarsState createState() {
    return AvatarsState();
  }
}

class AvatarsState extends State<Avatars> {
  String name;
  final _formKey = GlobalKey<FormState>();

  Card buildItem(DocumentSnapshot doc, AvatarsBloc bloc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'nameAvatar: ${doc.data['femenino']}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  /*TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'name',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => name = value,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AvatarsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
        backgroundColor: Color(0xffEFB810),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          /*Form(
            key: _formKey,
            child: buildTextFormField(),
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
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatars"),
        backgroundColor: Color(0xffEFB810),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardReceta2(context, 'assets/avatars/Avatar_01.png'),
          SizedBox(height: 30.0),
        ]
      ),
    );
  }

  Widget _cardReceta2(BuildContext context, String imageReceta) {

    final card =  Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: AssetImage(imageReceta),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tengo idea que poner'),
            )
        ],
      ),
    );


    return GestureDetector(

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, -10.0)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ),
      ),
      onTap: () {
      }
      
    );

  }
*/

}