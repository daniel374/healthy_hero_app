import 'package:flutter/material.dart';
import 'package:healthy_hero/src/ui/home/home.dart';

void main() => runApp(BlogApp());

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App II",
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.redAccent
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}