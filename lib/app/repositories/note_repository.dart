// ignore_for_file: non_constant_identifier_names

import 'package:agenna/app/models/notefication.dart';
import 'package:dio/dio.dart';


import 'package:agenna/app/providers/data_api_client.dart';

class NoteRepository {
  DataApiClient? _apiClient;

  NoteRepository() {
    this._apiClient = DataApiClient(httpClient: Dio());
  }


  Future<List<NoteficationModel>> NoteList(String token) async {
    return await _apiClient!.getNotes(token);
  }


}