import 'package:flutter/material.dart';
import 'package:hrm_employee/Screens/Attendance%20Management/my_attendance.dart';
import 'package:hrm_employee/Screens/Work%20Report/daily_work_report.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class EmployeeManagement extends StatefulWidget {
  String usernames,users_id;

   EmployeeManagement({required this.usernames, required this.users_id, Key? key,}) : super(key: key);

  @override
  _EmployeeManagementState createState() => _EmployeeManagementState();
    
}

class _EmployeeManagementState extends State<EmployeeManagement> {
  @override
  Widget build(BuildContext context) {
       var usernames1=widget.usernames;
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
          'Attendance',
         
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFFFD73B0),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: (){
               Navigator.push(
                           context, MaterialPageRoute(builder: (context) => MyAttendance(users_id: userId1,usernames: usernames1)));
                        },
                        leading: const Image(image: AssetImage('images/timeattendance.png')),
                        title: Text(
                          'My Attendance',
                          maxLines: 2,
                          style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: GestureDetector(
                      onTap: (){
               Navigator.push(
                           context, MaterialPageRoute(builder: (context) => DailyWorkReport(users_id: userId1,usernames: usernames1)));
                        },
                      child: Container(
                        width: context.width(),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF7D6AEF),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          leading: const Image(image: AssetImage('images/attendancereport.png')),
                          title: Text(
                            'Attendance Report',
                            maxLines: 2,
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
