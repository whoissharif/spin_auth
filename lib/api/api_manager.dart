import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:spin_auth/constants/urls.dart';

class ApiManager {
  var client = http.Client();
  Future<dynamic> send(Map<String, String> body) async {
    late Map<String, dynamic> map;
    try {
      var response =
          await http.post(Uri.parse(Urls.baseUrl + Urls.sendUrl), body: body);
      if (response.statusCode == 201 || response.statusCode == 400) {
        map = json.decode(response.body);
      }
    } catch (e) {
      log("ex: $e");
    }
    return map;
  }

  Future<dynamic> register(Map<String, String> body) async {
    late Map<String, dynamic> map;
    try {
      var response =
          await http.post(Uri.parse(Urls.baseUrl + Urls.registerUrl), body: body);
      if (response.statusCode == 201 || response.statusCode == 400) {
        map = json.decode(response.body);
      }
    } catch (e) {
      log("ex: $e");
    }
    return map;
  }

  Future<dynamic> login(Map<String, String> body) async {
    late Map<String, dynamic> map;
    try {
      var response =
          await http.post(Uri.parse(Urls.baseUrl + Urls.loginUrl), body: body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        map = json.decode(response.body);
      }
    } catch (e) {
      log("ex: $e");
    }
    return map;
  }
}
