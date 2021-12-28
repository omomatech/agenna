// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:agenna/app/models/notefication.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:agenna/app/helper/helper_function.dart';
import 'package:agenna/app/models/img_visting_model.dart';
import 'package:agenna/app/models/setting_model.dart';
import 'package:agenna/app/models/user_model.dart';
import 'package:agenna/app/models/visiting_model.dart';
import 'package:agenna/app/services/global_serv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataApiClient {
  final _globalService = Get.find<GlobalServ>();

  String? get baseUrl => _globalService.globalmodel.value.baseUrl;

  final Dio? httpClient;

  final Options _options = buildCacheOptions(Duration(days: 3), forceRefresh: true,);

  DataApiClient({this.httpClient}) {
    httpClient!.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> logoutapi(String token) async{
    var url = Uri.parse(baseUrl!+"accounts/logoutapp");

    var response = await http.post(url,headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'Authorization': 'token $token'
    });
    if(response.statusCode==200){

      return jsonDecode(response.body);

    }else{
      if(response.statusCode>=400&&response.statusCode<=500) {
        throw 'error occured internt'.tr;
      }
      else
      {
        throw Exception(response.body);
      }
    }
  }

  Future<User> getLogin(String username,String password,String token_notifcation) async{

    var data=jsonEncode(<String, dynamic>{"username": username, "password": password,'token_notifcation':token_notifcation});
    var url = Uri.parse(baseUrl!+"accounts/loginuser");
    var response = await http.post(url, body: data,headers: {
    "Accept": "application/json",
    "content-type": "application/json"
    });

    if(response.statusCode==200){

      return User.fromJson(jsonDecode(response.body));

    }else{

     if(response.statusCode>=400&&response.statusCode<=500)
         {
             if(jsonDecode(response.body)['non_field_errors'].toString().length>0)
             {
               throw 'phone number not valid or password'.tr;
             }
             else
               {
                 throw 'error occured internt'.tr;

               }
        }
     throw Exception(response.body);
    }
  }
  Future<List<Visiting_model>> getVisting(String param_user,String token) async{


    var url = Uri.parse(baseUrl!+"home/homeuser?unique_id=$param_user",);
    var response = await http.get(url,headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'Authorization': 'token $token'
    });
    if(response.statusCode==200){

         return jsonDecode(response.body).map<Visiting_model>((obj)=>Visiting_model.fromJson(obj)).toList();

    }else{
      if(response.statusCode>=400&&response.statusCode<=500) {
         throw 'error occured internt'.tr;
      }
      else
        {
          throw Exception(response.body);
        }
    }
  }
  Future<List<NoteficationModel>> getNotes(String token) async{
    var url = Uri.parse(baseUrl!+"notifcation/notes",);
    var response = await http.get(url,headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'Authorization': 'token $token'
    });
    if(response.statusCode==200){

      return jsonDecode(utf8.decode(response.bodyBytes)).map<NoteficationModel>((obj)=>NoteficationModel.fromJson(obj)).toList();

    }else{
      if(response.statusCode>=400&&response.statusCode<=500) {
        throw 'error occured internt'.tr;
      }
      else
      {
        throw Exception(response.body);
      }
    }
  }
  Future<List<ImgVisiting_model>> getImgIisting(String unique_id,String token) async{
    var url = Uri.parse(baseUrl!+"home/Img_Visiting?unique_id=$unique_id",);
    var response = await http.get(url,headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'Authorization': 'token $token'
    });
    if(response.statusCode==200){

      return jsonDecode(response.body).map<ImgVisiting_model>((obj)=>ImgVisiting_model.fromJson(obj)).toList();

    }else{

      if(response.statusCode>=400&&response.statusCode<=500) {
        throw 'error occured internt'.tr;
      }
      else
      {
        throw Exception(response.body);
      }
    }
  }

  Future<Setting> getSettings() async {
    var response =
        await HelperFunction.getJsonFile('asset/locales/settings.json');

    if (response != null) {
      return Setting.fromJson(response);
    } else {
      if(response.statusCode>=400&&response.statusCode<=500) {
        throw 'error occured internt'.tr;
      }
      else
      {
        throw Exception(response.body);
      }
    }
  }
}
