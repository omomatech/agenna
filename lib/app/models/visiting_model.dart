// ignore_for_file: unnecessary_this, prefer_collection_literals

 class Visiting_model{
  String? profile;
  String? created;
  String? updated;
  String? unique_id;

  Visiting_model({this.profile,this.created,this.updated,this.unique_id});
  Visiting_model.fromJson(Map<String, dynamic> json) {
    profile = json['profile'];
    created = json['created'] ;
    unique_id = json['unique_id'] ;
    updated = json['updated'] ;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['profile'] = this.profile;
    data['created'] = this.created;
    data['unique_id'] = this.unique_id;
    data['updated'] = this.updated;

    return data;
  }
}