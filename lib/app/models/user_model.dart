
// ignore_for_file: prefer_collection_literals, unnecessary_this

class User {
  String? unique_id;
  String? name;

  String? token;
  String? username;


  User({this.unique_id,this.username,this.name,this.token,});

  User.fromJson(Map<String, dynamic> json) {
    unique_id = json['unique_id'];
    name = json['name'];
    username = json['username'];

    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['unique_id'] = this.unique_id;
    data['name'] = this.name;
    data['username'] = this.username;

    data['token'] = this.token;
    return data;
  }





}