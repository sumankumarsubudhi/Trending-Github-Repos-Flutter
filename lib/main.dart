import 'package:flutter/material.dart';
import 'package:trending_github/github_home.dart';

void main(){

  runApp(new TrendingApp());
}

class TrendingApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Trending App",
      theme: ThemeData.dark(),
      home: GithubHome()
    );
  }
}