import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_api.dart';
import 'package:http/http.dart';

import 'network_exception.dart';

abstract class ParametersAb {
  final Map<String, dynamic> parameter;

  ParametersAb({this.parameter});
}

abstract class HttpRequestProtocol {
  ParametersAb param;

  String get baseUrl => api.apiUrl;

  String get basePath;

  String get path;

  HttpType get method;

//  Future<Map<String, String>> get headers {
//    Map<String, String> header = {
//      HttpHeaders.contentTypeHeader: "application/json"
//    };
//
//    return FlutterSecureStorage().read(key: "token").then((v) {
//      if (v != null) {
//        header["Authorization"] = "Bearer $v";
//      }
//
//      return header;
//    }).catchError((e) => header);
//  }

  Map<String, String> get headers {
    return headers;
  }

  /// Do not override this getter. Whenever the method's request is GET,
  /// the layer will concatenate the parameters into the query.
  String get _queryParameters {
    if (method == HttpType.get && param != null) {
      final jsonString = Uri(queryParameters: param.parameter);
      return '?${jsonString.query}';
    }

    return '';
  }

  Future<Map<String, dynamic>> request() async {
    Future<Response> response;
    String url = "$baseUrl$basePath$path";
    switch (method) {
      case HttpType.get:
        response = get("$url$_queryParameters", headers: await headers);
        break;
      case HttpType.post:
        response = post(url,
            body: json.encode(param?.parameter ?? ""), headers: await headers);
        break;
      case HttpType.put:
        response = put(url,
            body: json.encode(param?.parameter ?? ""), headers: await headers);
        break;
      case HttpType.patch:
        response = patch(url,
            body: json.encode(param?.parameter ?? ""), headers: await headers);
        break;
      case HttpType.delete:
        response = delete(url, headers: await headers);
        break;
    }
    return response.then(_response);
  }

  Map<String, dynamic> _response(Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
//        BlocProvider.of<AuthBloc>(mainKey.currentContext).add(RequestLogout());
        throw NetworkException("auth error");
      case 404:
        throw response.statusCode.toString();
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 409:
        throw response.statusCode.toString();
      case 500:
        throw NetworkException("server error");
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
