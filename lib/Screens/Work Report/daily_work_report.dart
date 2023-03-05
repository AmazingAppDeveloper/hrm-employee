import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';


class Userdata {
  // ignore: duplicate_ignore

  final String user_id,
      attendance_date,
      clock_in,
      clock_out,
        location;

  Userdata({
    required this.user_id,
    required this.attendance_date,
    required this.clock_in,
    required this.clock_out,
      required this.location
   
  });

  factory Userdata.fromJson(Map<String, dynamic> jsonData) {
    return Userdata(
      user_id: jsonData['employee_id'],
      attendance_date: jsonData['attendance_date'],
      clock_in: jsonData['clock_in'],
      clock_out: jsonData['clock_out'],
          location: jsonData['location'],
    
    );
  }
}



Future<List<Userdata>> fetchAlbum(users_id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 
  final response = await http.post(
      Uri.parse('http://growfictechnology.com/voltas/api/attendancelist.php'),
      body: {
        'user_id': users_id, //get the username text
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

class DailyWorkReport extends StatefulWidget {
     String usernames,users_id;
   DailyWorkReport({ required this.usernames, required this.users_id, Key? key,}) : super(key: key);
  @override
  _DailyWorkReportState createState() => _DailyWorkReportState();
}
late Future<List<Userdata>> futureAlbum;
      
class _DailyWorkReportState extends State<DailyWorkReport> {

  // DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    futureAlbum = fetchAlbum(widget.users_id);
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Attendance Report',
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Container(
        //       padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        //       decoration: BoxDecoration(
        //         border: Border.all(color: Colors.white),
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       child: Row(
        //         children: [
        //           Text(
        //             selectedDate.day.toString()+'/'+selectedDate.month.toString()+'/'+selectedDate.year.toString(),
        //             style: kTextStyle.copyWith(color: Colors.white),
        //           ),
        //           const SizedBox(
        //             width: 4.0,
        //           ),
        //           const Icon(
        //             Icons.calendar_today_outlined,
        //             color: Colors.white,
        //           ),
        //         ],
        //       ),
        //     ).onTap(()=> _selectDate(context)),
        //   ),
        // ],
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          const SizedBox(height: 20.0,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Color(0xFFFAFAFA),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0,),
                  Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(child: Text('Date',style: kTextStyle.copyWith(fontWeight: FontWeight.bold),))),
                              Expanded(child: Center(child: Text('In Time',style: kTextStyle.copyWith(fontWeight: FontWeight.bold),))),
                              Expanded(child: Center(child: Text('Out Time',style: kTextStyle.copyWith(fontWeight: FontWeight.bold),))),
                            Expanded(child: Center(child: Text('Location',style: kTextStyle.copyWith(fontWeight: FontWeight.bold),))),

                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(color: kBorderColorTextField,thickness: 1.0,),
                          ),
SizedBox(
   height: 400.0,
        child: FutureBuilder<List<Userdata>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Stack(
                      children: [
                        Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Center(child: Text(snapshot.data![index].attendance_date,style: kTextStyle.copyWith(color: Colors.black,fontSize: 12.0),))),
                                  Expanded(child: Center(child: Text(snapshot.data![index].clock_in,style: kTextStyle.copyWith(color: Colors.green,fontSize: 12.0),))),
                                  Expanded(child: Center(child: Text(snapshot.data![index].clock_out,style: kTextStyle.copyWith(color: Colors.red,fontSize: 12.0),))),
                                    Expanded(child: Center(child: Text(snapshot.data![index].location,style: kTextStyle.copyWith(color: Colors.black,fontSize: 12.0),))),
                                ],
                              ),
                            ),
                          ],
                       ) );}
                        return const Text("Loading..");
                       }
                       
                       ))],
                      )
                      ),
                    ),
         ] ),
      )),]
      ),
    );
              
      

    
  }
}
