// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:agenna/app/models/visiting_model.dart';

import 'package:agenna/app/providers/data_api_client.dart';

class VisitingRepository {
  DataApiClient? _apiClient;

  VisitingRepository() {
    this._apiClient = DataApiClient(httpClient: Dio());
  }


  Future<List<Visiting_model>> VisitingsList(String param_user,String token) {
    return _apiClient!.getVisting(param_user,token);
  }


}
