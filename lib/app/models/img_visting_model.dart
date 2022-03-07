
// ignore_for_file: prefer_collection_literals, unnecessary_this

class ImgVisiting_model{
  String? visiting_id;
  String? created;
  String? updated;
  String? unique_id;
  String? img_visiting;

  ImgVisiting_model(this.visiting_id,this.created,this.updated,this.unique_id,this.img_visiting);
  ImgVisiting_model.fromJson(Map<String, dynamic> json) {
    visiting_id = json['visiting_id'];
    created = json['created'];
    unique_id = json['unique_id'];
    img_visiting = json['img_visiting'];
    updated = json['updated'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['visiting_id'] = this.visiting_id;
    data['created'] = this.created;
    data['unique_id'] = this.unique_id;
    data['img_visiting'] = this.img_visiting;
    data['updated'] = this.updated;
    return data;
  }
}