
import 'package:dio/dio.dart';
import 'package:agenna/app/models/setting_model.dart';
import 'package:agenna/app/providers/data_api_client.dart';

class SettingRepos {
  DataApiClient? _dataApiClient;
  SettingRepos() {
    _dataApiClient = DataApiClient(httpClient: Dio());
  }

  Future<Setting> get() {
    return _dataApiClient!.getSettings();
  }
  Future<dynamic> logoutapi(String token){
    return _dataApiClient!.logoutapi(token);

  }
}
