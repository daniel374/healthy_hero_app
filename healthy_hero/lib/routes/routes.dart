import 'package:flutter/material.dart';
import 'package:healthy_hero/src/camera/imgDetailFood.dart';
import 'package:healthy_hero/src/ui/pages/avatar_page.dart';
import 'package:healthy_hero/src/ui/pages/foods_page.dart';
import 'package:healthy_hero/src/ui/pages/home_page.dart';
import 'package:healthy_hero/src/ui/pages/news_page.dart';
import 'package:healthy_hero/src/ui/pages/profile_page.dart';
import 'package:healthy_hero/src/ui/pages/recipe_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes({name}) {
  
  return <String, WidgetBuilder>{
      '/home' : (BuildContext context) => MyHomePage(name: name,),
      "/news" : (BuildContext context) => NewsPage(),
      "/recipes" : (BuildContext context) => RecipePage(),
      "/profile" : (BuildContext context) => ProfilePage(),
      "/avatars" : (BuildContext context) => AvatarsPage(),
      "/listalimentos" : (BuildContext context) => FoodsPage(),
      "/detalleAlimentos" : (BuildContext context) => LandingScreen(),
  };

}