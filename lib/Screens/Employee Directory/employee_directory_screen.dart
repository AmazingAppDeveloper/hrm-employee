import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';
import 'employee_directory_details.dart';
import 'employee_tasklist.dart';


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

class EmployeeDirectory extends StatefulWidget {
   String usernames,users_id;
  EmployeeDirectory({ required this.usernames, required this.users_id, Key? key,}) : super(key: key);

  @override
  _EmployeeDirectoryState createState() => _EmployeeDirectoryState();
}

class _EmployeeDirectoryState extends State<EmployeeDirectory> {
    late Future<List<Userdata>> futureAlbum;
      void initState() {
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    var userId1=widget.users_id;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Task Checklist',
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
      body: SizedBox(
        child: FutureBuilder<List<Userdata>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Stack(
        children: [
           SizedBox(
        
          ),
          
             Container(
              width: context.width(),
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(30.0),
                //     topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kGreyTextColor.withOpacity(0.5)),
                    ),
                    child: ListTile(
                      onTap: (){
                        
                var title='${snapshot.data![index].project_title}';
                var endDate='${snapshot.data![index].end_date}';
                  var projectId='${snapshot.data![index].project_id}';
                  var startDate='${snapshot.data![index].start_date}';
                    var assignedTo='${snapshot.data![index].assigned_to}';
                    var taskId='${snapshot.data![index].task_id}';
                    var taskName='${snapshot.data![index].task_name}';
            
                 var user_id='${snapshot.data![index].task_id}';
                           EmployeeDetails(first_name: title,contact_no: assignedTo, date_of_birth: taskName, email: projectId,task_id: taskId,user_id:userId1
                           ).launch(context);
                // EmployeeTaskList(
                // ).launch(context);
                      },
                      leading: Icon(Icons.task_rounded,color: Colors.blueAccent,),
                      title: Text('${snapshot.data![index].project_title} '+'-'+'${snapshot.data![index].task_name}',style: kTextStyle,),
                      subtitle:  Text('Start :${snapshot.data![index].start_date} \n''End: ${snapshot.data![index].end_date} ',style: kTextStyle.copyWith(color: kGreyTextColor),),
                      trailing: const Icon(Icons.arrow_forward_ios,color: kGreyTextColor,),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),

                ],
              ),
            ),
     
        ], ));
              }
              return const Text("Loading..");
            }),
      ),
    );
  }
}
