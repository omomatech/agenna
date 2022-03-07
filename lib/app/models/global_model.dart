
class GlobalModel{

  String? baseUrl;
  GlobalModel({this.baseUrl});

   GlobalModel.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'].toString();
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['baseUrl'] = this.baseUrl;
    return data;
  }

}
