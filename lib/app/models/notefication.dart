class NoteficationModel{
  String? img_note;
  String? created;
  String? notfication;
  String? content_note;
  String? category_note;
  bool?   expired;
  String? date_sending;
  String? updated;
  String? unique_id;

  NoteficationModel({this.notfication,this.date_sending,this.category_note,this.expired,this.content_note,this.img_note,this.created,this.updated,this.unique_id});
  NoteficationModel.fromJson(Map<String, dynamic> json) {
    img_note = json['img_note'];
    notfication = json['notfication'] ;
    date_sending = json['date_sending'] ;
    category_note = json['category_note'] ;
    expired = json['expired'] ;
    content_note = json['content_note'] ;
    created = json['created'] ;
    unique_id = json['unique_id'] ;
    updated = json['updated'] ;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['img_note'] = this.img_note;
    data['notfication'] = this.notfication;
    data['date_sending'] = this.date_sending;
    data['category_note'] = this.category_note;
    data['expired'] = this.expired;
    data['content_note'] = this.content_note;
    data['created'] = this.created;
    data['unique_id'] = this.unique_id;
    data['updated'] = this.updated;

    return data;
  }
}