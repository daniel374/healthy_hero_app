import 'package:flutter/material.dart';

import 'detail_recipe_page.dart';


class RecipePage extends StatelessWidget {

  final List<String> fruits = ["Apples", "Oranges", "Bananas"];

  //get itemCount => fruits.length;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("recetas"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardReceta1(context, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Neckertal_20150527-6384.jpg/1280px-Neckertal_20150527-6384.jpg'),
          SizedBox(height: 30.0),
          _cardReceta2(context, 'assets/pancakes_avena.jpeg'),
          SizedBox(height: 30.0),
          _cardReceta2(context, 'assets/pollo.jpeg'),
          SizedBox(height: 30.0),
          _cardReceta2(context, 'assets/receta1.jpg'),
          SizedBox(height: 30.0),
          _cardReceta1(context,'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Neckertal_20150527-6384.jpg/1280px-Neckertal_20150527-6384.jpg'),
          SizedBox(height: 30.0),
        ]
      ),
    );
  }

 /* Widget _cardReceta(BuildContext context){

    return Card(
      color: Colors.white,
      child: Column(
        children: <Widget> [
          SizedBox(
            height: 180.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    "lib/src/resources/images/pollo.jpeg",
                    fit: BoxFit.cover,
                  ), 
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Receta de pollo', 
                      style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white)
                    ),
                  ))
              ],
            ),
          ),
        ],
      ),
    );
  }*/

  Widget _cardReceta1(BuildContext context,String imageReceta) {

    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(imageReceta),
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailRecipe(fruits[0])) );
      },
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailRecipe(fruits[1])) );
      }
      
    );

  }


}