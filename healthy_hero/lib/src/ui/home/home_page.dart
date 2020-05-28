import 'package:healthy_hero/src/bloc/blog_bloc/blog_bloc.dart';
import 'package:healthy_hero/src/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> postList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return Center(child: CircularProgressIndicator(),);
        }
        if (state is BlogNoLoaded) {
          return Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.error),
                Text('Cannot load posts')
              ],
            ),
          );
        }
        if (state is BlogLoaded) {
          postList = state.posts;
          return Container(
            child: postList.length == 0
              ? Center(child: Text('No Blog Avaliable'),)
              : ListView.builder(
                itemCount: postList.length,
                itemBuilder: (_, index){
                  return postsUI(
                    postList[index].image,
                    postList[index].description,
                    postList[index].date,
                    postList[index].time
                  );
                },
              )
          );
        }
        return Container();
      }
    );
  }

  Widget postsUI(String image, String description, String date, String time){
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
                  (date != "") ? date : "date",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  (time != "") ? time : "time",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Image.network(
              (image != null) ? image : "image",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0,),
            Text(
              (description != null) ? description : "description",
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
  
}