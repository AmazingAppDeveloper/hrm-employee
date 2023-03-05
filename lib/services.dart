// ignore_for_file: constant_identifier_names, prefer_collection_literals, unused_field

import 'dart:convert';
import 'Services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/attedance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/attedance.dart'; // add the http plugin in pubspec.yaml file.

class Services {
  static const ROOT = 'http://hrms.webcloudinfotech.in/scripts/attendance.php';
  static const _GET_ALL_ACTION = 'GET_ALL';

  static Future<List<Employee>> getEmployees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString('user_id');
    try {
      var map = Map<String, dynamic>();
      //map['action'] = _GET_ALL_ACTION;
      map['username'] = "1";
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (kDebugMode) {
        print('getEmployees Response: ${response.body}');
        print(user);
      }
      if (200 == response.statusCode) {
        List<Employee> list = parseResponse(response.body);
        return list;
      } else {
        return <Employee>[];
      }
    } catch (e) {
      return <Employee>[]; // return an empty list on exception/error
    }
  }

  static List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }
}
