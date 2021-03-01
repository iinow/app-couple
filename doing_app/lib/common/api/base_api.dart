import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final API_URL = "https://localhost:8080/api/v1";
final API_URL_TEST = "https://localhost:8080/api/v1";

abstract class BaseAPI {
  Future fetch({dynamic param, @required BuildContext context});

  Future setData({dynamic param});

  Future update({dynamic param});

  Future deleteData({dynamic param});
}

enum HttpType {
  get,
  post,
  put,
  delete,
  patch,
}

class API {
  String apiUrl;
  HttpType httpType;
  Map<String, dynamic> result;
  String returnUrl = "";

  API() {
    apiUrl = API_URL; // 릴리즈 모드일시
    assert(() {
      apiUrl = API_URL_TEST; // 디버그 모드일시
      return true;
    }());
  }

  Future<Map<String, dynamic>> get(String url) async {
    http.Response response = await http.get("$url");

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
        break;
      default:
        throw Exception(response.body);
        break;
    }
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    http.Response response = await http.post("$url", body: data);

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
        break;
      default:
        throw Exception(response.body);
        break;
    }
  }

  Future<Map<String, dynamic>> delete(String url) async {
    http.Response response = await http.delete("$url");

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
        break;
      default:
        throw Exception(response.body);
        break;
    }
  }

  Future sendRequest(HttpType httpType, String returnUrl, dynamic param) async {
    var result;

    switch (httpType) {
      case HttpType.get:
        result = await api.get("$returnUrl");
        break;

      case HttpType.post:
        result = await api.post("$returnUrl", param.toMap());
        break;

      case HttpType.delete:
        result = await api.delete("$returnUrl");
        break;
    }
    return result;
  }
}

API api = API();
