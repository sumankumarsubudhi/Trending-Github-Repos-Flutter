import 'package:flutter/material.dart';
import 'package:trending_github/api_services.dart';
import 'package:trending_github/repo_model.dart';

class GithubHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getRepositories();
    return Scaffold(
      backgroundColor:  Colors.blueGrey[800],
      appBar:AppBar(
        elevation: 0.0,
          backgroundColor: Colors.blueGrey[800],
        title: Text("Trending Repositories"),
        centerTitle: true,
      ),
     body: FutureBuilder(
       future: getRepositories(),
       builder: (context, snapshot){
         if(snapshot.hasData) {
           return ListView.builder(
             itemCount: snapshot.data.length,
             itemBuilder: (context, index) => RepoCard(
               repoList: snapshot.data[index],
             ),
           );
         }
       else{
         return Center(child: CircularProgressIndicator());
         }
       }
     ),
    );
  }
}

class RepoCard extends StatelessWidget {
  final RepoList repoList;

  RepoCard({
    @required this.repoList
  });

  @override
  getAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage: NetworkImage(repoList.avatar),
    );
  }


  getRepoInfo() {
    return Expanded(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.blueGrey[800], fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(text: '${repoList.username}/ ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: repoList.repo.name)
                  ]
              ),
            ),
            Text(repoList.repo.description, style: TextStyle(color: Colors.blueGrey),)
          ]
      ),
    );
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              getAvatar(),
              SizedBox(width: 10.0,),
              getRepoInfo(),
            ],
          ),
        )
    );
  }


}