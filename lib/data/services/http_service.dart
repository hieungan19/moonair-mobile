import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moonair/data/services/data_center.dart';

class HttpService {
  static Future<http.Response> postRequest({body, url}) async {
    return await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${DataCenter.token}',
        },
        body: body);
  }

  static Future<http.Response> patchRequest({body, url}) async {
    return await http.patch(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${DataCenter.token}',
        },
        body: body);
  }

  static Future<http.Response> getRequest(url) async {
    return await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${DataCenter.token}',
      },
    );
  }

  static Future<http.Response> deleteRequest({required String url}) async {
    return await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${DataCenter.token}',
      },
    );
  }

  static Future<http.Response> postRequestWithParam(
      {required Map<String, dynamic> parameters, required String url}) async {
    final uri = Uri.parse(url);

    // Append query parameters to the URL
    final uriWithParams = uri.replace(queryParameters: parameters);

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${DataCenter.token}',
    };

    return await http.post(uriWithParams, headers: headers);
  }

  static Future<http.Response> patchRequestWithParam(
      {required Map<String, dynamic> parameters, required String url}) async {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${DataCenter.token}',
    };

    return await http.put(
      Uri.parse(url).replace(queryParameters: parameters),
      headers: headers,
    );
  }
}
