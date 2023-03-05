import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';
import 'employee_directory_details.dart';


class Userdata {
  // ignore: duplicate_ignore

  final String task_id,
      task_name,
      start_date,
      assigned_to,
      end_date,
      project_id,
      project_title;

  Userdata({
    required this.task_id,
    required this.task_name,
    required this.start_date,
    required this.assigned_to,
    required this.end_date,
    required this.project_id,
    required this.project_title,
   
  });

  factory Userdata.fromJson(Map<String, dynamic> jsonData) {
    return Userdata(
      task_id: jsonData['task_id'],
      task_name: jsonData['task_name'],
      start_date: jsonData['start_date'],
      assigned_to: jsonData['assigned_to'],
      project_id: jsonData['project_id'],
      project_title: jsonData['project_title'],
      end_date: jsonData['end_date'],
    );
  }
}

Future<List<Userdata>> fetchAlbum() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 
  final response = await http.post(
      Uri.parse('http://growfictechnology.com/voltas/api/task.php'),
      body: {
        'username': "raviramsen", //get the username text
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Userdata.fromJson(jsonDecode(response.body));
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    if (kDebugMode) {
      print('getEmployees Response: ${response.body}');
    }
    return parsed.map<Userdata>((json) => Userdata.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class EmployeeTaskList extends StatelessWidget {
    late Future<List<Userdata>> futureAlbum;
      void initState() {
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Planed task',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // actions: const [
        //   Image(
        //     image: AssetImage('images/employeesearch.png'),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('images/plus.png',width: 60,
              height: 60,),
          ),
        ],

      ),
    );
  }
}
