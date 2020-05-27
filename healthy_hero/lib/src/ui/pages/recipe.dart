import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthy_hero/bloc_provider.dart';
import 'package:healthy_hero/src/bloc/recipes_bloc/recipe_bloc.dart';

class Recipes extends StatefulWidget {
  @override
  RecipesState createState() {
    return RecipesState();
  }
}

class RecipesState extends State<Recipes> {
  String name;
  final _formKey = GlobalKey<FormState>();

  Card buildItem(DocumentSnapshot doc, RecipeBloc bloc) {
    return Card(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => bloc.updateData(doc),
                  child: Text('Update todo', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => bloc.deleteData(doc),
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
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
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RecipeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
        backgroundColor: Color(0xffEFB810),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () => validateAndCreateData(bloc),
                child: Text('Create', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
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
          ),
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

  void validateAndCreateData(RecipeBloc bloc) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      bloc.createData(name);
    }
  }
}