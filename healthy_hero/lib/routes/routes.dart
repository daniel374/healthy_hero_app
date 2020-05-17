import 'package:flutter/material.dart';
import 'package:healthy_hero/src/ui/pages/home_page.dart';
import 'package:healthy_hero/src/ui/pages/news_page.dart';
import 'package:healthy_hero/src/ui/pages/profile_page.dart';
import 'package:healthy_hero/src/ui/pages/recipe_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  
  return <String, WidgetBuilder>{
      '/home' : (BuildContext context) => MyHomePage(name: null,),
      "/news" : (BuildContext context) => NewsPage(),
      "/recipes" : (BuildContext context) => RecipePage(),
      "/profile" : (BuildContext context) => ProfilePage(),
  };

}