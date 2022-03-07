import 'package:dio/dio.dart';

import '../models/user_model.dart';
import 'package:agenna/app/providers/data_api_client.dart';

class UserRepository {
  DataApiClient? _apiClient;

  UserRepository() {
    this._apiClient = DataApiClient(httpClient: Dio());
  }


  Future<User> login(String username,String password,String token_notifcation) {
    return _apiClient!.getLogin(username,password,token_notifcation);
  }


}
