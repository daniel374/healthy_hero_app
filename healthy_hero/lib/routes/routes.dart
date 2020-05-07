import 'package:flutter/material.dart';

import 'package:healthy_hero/src/pages/home_page.dart';
import 'package:healthy_hero/src/pages/login_page.dart';
import 'package:healthy_hero/src/pages/news_page.dart';
import 'package:healthy_hero/src/pages/profile_page.dart';
import 'package:healthy_hero/src/pages/recipe_page.dart';
import 'package:healthy_hero/src/pages/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  
  return <String, WidgetBuilder>{
      '/home' : (BuildContext context) => MyHomePage(),
      "/news" : (BuildContext context) => NewsPage(),
      "/recipes" : (BuildContext context) => RecipePage(),
      "/login" : (BuildContext context) => LoginPage(),
      "/profile" : (BuildContext context) => ProfilePage(),
      "/register" : (BuildContext context) => RegisterPage(),
  };

}