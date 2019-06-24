// To parse this JSON data, do
//
//     final repoList = repoListFromJson(jsonString);

import 'dart:convert';

List<RepoList> repoListFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<RepoList>.from(jsonData.map((x) => RepoList.fromJson(x)));
}

String repoListToJson(List<RepoList> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class RepoList {
  String username;
  String name;
  String url;
  String avatar;
  Repo repo;

  RepoList({
    this.username,
    this.name,
    this.url,
    this.avatar,
    this.repo,
  });

  factory RepoList.fromJson(Map<String, dynamic> json) => new RepoList(
    username: json["username"],
    name: json["name"] == null ? null : json["name"],
    url: json["url"],
    avatar: json["avatar"],
    repo: Repo.fromJson(json["repo"]),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "name": name == null ? null : name,
    "url": url,
    "avatar": avatar,
    "repo": repo.toJson(),
  };
}

class Repo {
  String name;
  String description;
  String url;

  Repo({
    this.name,
    this.description,
    this.url,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => new Repo(
    name: json["name"],
    description: json["description"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "url": url,
  };
}
