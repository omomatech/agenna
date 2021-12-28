import 'package:dio/dio.dart';
import 'package:agenna/app/models/img_visting_model.dart';
import 'package:agenna/app/models/visiting_model.dart';

import '../models/user_model.dart';
import 'package:agenna/app/providers/data_api_client.dart';

class Img_Visiting_Repository {
  DataApiClient? _apiClient;

  Img_Visiting_Repository() {
    this._apiClient = DataApiClient(httpClient: Dio());
  }


  Future<List<ImgVisiting_model>> Img_Visitings(String uuid,String token) async {
    return await _apiClient!.getImgIisting(uuid,token);
  }


}
