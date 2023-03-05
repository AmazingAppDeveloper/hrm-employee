import 'package:flutter/material.dart';
import 'package:hrm_employee/Screens/Attendance%20Management/my_attendance.dart';
import 'package:hrm_employee/Screens/Authentication/edit_profile.dart';
import 'package:hrm_employee/Screens/Authentication/profile_screen.dart';
import 'package:hrm_employee/Screens/Authentication/sign_in.dart';
import 'package:hrm_employee/Screens/Chat/chat_list.dart';
import 'package:hrm_employee/Screens/Employee%20Directory/employee_directory_screen.dart';
import 'package:hrm_employee/Screens/Leave%20Management/leave_management_screen.dart';
import 'package:hrm_employee/Screens/Loan/loan_list.dart';
import 'package:hrm_employee/Screens/Notice%20Board/notice_list.dart';
import 'package:hrm_employee/Screens/Notification/notification_screen.dart';
import 'package:hrm_employee/Screens/Outwork%20Submission/outwork_list.dart';
import 'package:hrm_employee/Screens/Salary%20Management/salary_statement_list.dart';
import 'package:hrm_employee/Screens/Work%20Report/daily_work_report.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../constant.dart';
import '../Attendance Management/management_screen.dart';

class HomeScreen extends StatefulWidget {
   String usernames,users_id,name="",user_contact_no="",useraddress="",useremail='',usergender="";

   HomeScreen({ required this.usernames, required this.users_id,Key? key, required name, required user_contact_no, required useraddress, required useremail, required usergender, }) : super(key: key);
 
  
 
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
   
  @override
  Widget build(BuildContext context) {
    var usernames1=widget.usernames;
     var userId1=widget.users_id;
     var usergender=widget.usergender;
     toast(usergender);
     var useraddress=widget.useraddress;
     var userContactNo=widget.user_contact_no;
     var useremail=widget.useremail;
       var name=widget.name;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage('images/person.jpg'),
          ),
          title: Text(
            'Hi,'+ usernames1,
            style: kTextStyle.copyWith(color: Colors.white, fontSize: 12.0),
          ),
          // subtitle: Text(
          //   'Good Morning',
          //   style: kTextStyle.copyWith(
          //       color: Colors.white, fontWeight: FontWeight.bold),
          // ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              // height: context.height() / 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                color: kMainColor,
              ),
              child: Column(
                children: [
                  Container(
                    height: context.height() / 4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          const CircleAvatar(
                            radius: 60.0,
                            backgroundColor: kMainColor,
                            backgroundImage: AssetImage(
                              'images/person.jpg',
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${widget.usernames}',
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Employee',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ],
                      ).onTap(() {
                        // const ProfileScreen().launch(context);
                      }),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0,bottom: 10.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(80.0),
                  //             border: Border.all(color: Colors.white),
                  //             gradient: LinearGradient(
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               colors: [
                  //                 Colors.white.withOpacity(0.6),
                  //                 Colors.white.withOpacity(0.0),
                  //               ],
                  //             ),
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                 '22',
                  //                 style: kTextStyle.copyWith(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Text(
                  //                 'days',
                  //                 style:
                  //                     kTextStyle.copyWith(color: Colors.white),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         const SizedBox(height: 2.0,),
                  //         Text(
                  //           'Present',
                  //           style: kTextStyle.copyWith(color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0,bottom: 10.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(80.0),
                  //             border: Border.all(color: Colors.white),
                  //             gradient: LinearGradient(
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               colors: [
                  //                 Colors.white.withOpacity(0.6),
                  //                 Colors.white.withOpacity(0.0),
                  //               ],
                  //             ),
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                 '3',
                  //                 style: kTextStyle.copyWith(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Text(
                  //                 'days',
                  //                 style:
                  //                 kTextStyle.copyWith(color: Colors.white),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         const SizedBox(height: 2.0,),
                  //         Text(
                  //           'Late',
                  //           style: kTextStyle.copyWith(color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         Container(
                  //           padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0,bottom: 10.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(80.0),
                  //             border: Border.all(color: Colors.white),
                  //             gradient: LinearGradient(
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               colors: [
                  //                 Colors.white.withOpacity(0.6),
                  //                 Colors.white.withOpacity(0.0),
                  //               ],
                  //             ),
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                 '5',
                  //                 style: kTextStyle.copyWith(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Text(
                  //                 'days',
                  //                 style:
                  //                 kTextStyle.copyWith(color: Colors.white),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         const SizedBox(height: 2.0,),
                  //         Text(
                  //           'Absent',
                  //           style: kTextStyle.copyWith(color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // ListTile(
            //   onTap: () =>  Navigator.push(
            // context, MaterialPageRoute(builder: (context) => ProfileScreen( usernames: '${widget.usernames}',users_id : '${widget.users_id}',name :'${widget.name}',useremail:'${widget.useremail}',user_contact_no: '${widget.user_contact_no}',useraddress: '${widget.useraddress}',usergender: '${widget.usergender}'
              
            // ))),
            //   title: Text('Employee Profile',style: kTextStyle.copyWith(color: kTitleColor),),
            //   leading: const Icon(FeatherIcons.user,color: kMainColor,),
            // ),
            // ListTile(
            //   onTap: () => const NotificationScreen().launch(context),
            //   title: Text('Notification',style: kTextStyle.copyWith(color: kTitleColor),),
            //   leading: const Icon(FeatherIcons.bell,color: kMainColor,),
            // ),
            ListTile(
              title: Text('Terms & Conditions',style: kTextStyle.copyWith(color: kTitleColor),),
              leading: const Icon(Icons.info_outline,color: kMainColor,),
            ),
            ListTile(
              title: Text('Privacy Policy',style: kTextStyle.copyWith(color: kTitleColor),),
              leading: const Icon(FeatherIcons.alertTriangle,color: kMainColor,),
            ),
            ListTile(
               onTap: () => const EditProfile().launch(context),
              title: Text('Logout',style: kTextStyle.copyWith(color: kTitleColor),),
              leading: const Icon(FeatherIcons.logOut,color: kMainColor,),
            ),
             ListTile(
              
              title: Text('Version: 2023.01',style: kTextStyle.copyWith(color: kTitleColor),),
              leading: const Icon(FeatherIcons.star,color: kMainColor,),
            ),
            SizedBox(
              height: 100,
            ),
         Center(child:Text(
                                  'Designed and Powered By',
                                  style: kTextStyle.copyWith( fontSize: 10,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.normal),
                                ),) ,
              Image.asset(
                'images/webcloud.jpg',
                height: 50,
                width: 300,
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
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
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: (){
               Navigator.push(
                           context, MaterialPageRoute(builder: (context) => MyAttendance(users_id: userId1,usernames: usernames1)));
                        },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xFFFD72AF),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          'images/employeeattendace.png')),
                                  Text(
                                    'My',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Attendance',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Material(
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
                                   
                                    color: Color(0xFF02B984),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          'images/workreport.png')),
                                  Text(
                                    'Attendance ',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Report',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                           context, MaterialPageRoute(builder: (context) => EmployeeDirectory(users_id: userId1,usernames: usernames1)));
                      
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                     color: Color(0xFF7C69EE),
                                    
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          'images/employeedirectory.png')),
                                  Text(
                                    'Work',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Done',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Material(
                          elevation: 2.0,
                          child: GestureDetector(
                           
                             onTap: (){
               Navigator.push(
                           context, MaterialPageRoute(builder: (context) => EmployeeDirectory(users_id: userId1,usernames: usernames1)));
                      
                            },
                            child: Container(
                              width: context.width(),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                   color: Color(0xFF4ACDF9),
                                    width: 3.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image:
                                          AssetImage('images/leave.png')),
                                  Text(
                                    'Plan',
                                    maxLines: 2,
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Task',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),



            //       Material(
            //         elevation: 1.0,
            //         child: Container(
                      
            //           width: context.width(),
            //           padding: const EdgeInsets.all(10.0),
            //           decoration: const BoxDecoration(
            //             border: Border(
            //               left: BorderSide(
            //                 color: Color(0xFFFD72AF),
            //                 width: 3.0,
            //               ),
            //             ),
            //             color: Colors.white,
            //           ),
            //           child:   Column(
            //           children: [ ListTile(
            //             onTap: () {
                          
            //             },
            //             // leading: const Image(
            //             //     image: AssetImage('images/salarymanagement.png')),
            //             title: Text(
            //               'Pending Task',
            //               maxLines: 1,
            //               style: kTextStyle.copyWith(
            //                   color: kTitleColor, fontWeight: FontWeight.bold),
            //             ),
            //             trailing: const Icon(Icons.arrow_forward_ios),
            //           ),
            //           ListTile(
              
            //   title: Text('12-11-2023                      Work on website',style: kTextStyle.copyWith(color: kTitleColor,fontSize: 14),),
              
            // ),]
            //           ) 
            //         ),
            //       ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // Material(
                  //   elevation: 2.0,
                  //   child: Container(
                  //     width: context.width(),
                  //     padding: const EdgeInsets.all(10.0),
                  //     decoration: const BoxDecoration(
                  //       border: Border(
                  //         left: BorderSide(
                  //           color: Color(0xFF1CC389),
                  //           width: 3.0,
                  //         ),
                  //       ),
                  //       color: Colors.white,
                  //     ),
                  //     child: ListTile(
                  //       onTap: () => const NoticeList().launch(context),
                  //       leading: const Image(
                  //           image: AssetImage('images/noticeboard.png')),
                  //       title: Text(
                  //         'Notice Board',
                  //         maxLines: 2,
                  //         style: kTextStyle.copyWith(
                  //             color: kTitleColor, fontWeight: FontWeight.bold),
                  //       ),
                  //       trailing: const Icon(Icons.arrow_forward_ios),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // Material(
                  //   elevation: 2.0,
                  //   child: Container(
                  //     width: context.width(),
                  //     padding: const EdgeInsets.all(10.0),
                  //     decoration: const BoxDecoration(
                  //       border: Border(
                  //         left: BorderSide(
                  //           color: Color(0xFF7C69EE),
                  //           width: 3.0,
                  //         ),
                  //       ),
                  //       color: Colors.white,
                  //     ),
                  //     child: ListTile(
                  //       onTap: () => const OutworkList().launch(context),
                  //       leading: const Image(
                  //           image: AssetImage('images/outworksubmission.png')),
                  //       title: Text(
                  //         'Outwork Submission',
                  //         maxLines: 2,
                  //         style: kTextStyle.copyWith(
                  //             color: kTitleColor, fontWeight: FontWeight.bold),
                  //       ),
                  //       trailing: const Icon(Icons.arrow_forward_ios),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // Material(
                  //   elevation: 2.0,
                  //   child: Container(
                  //     width: context.width(),
                  //     padding: const EdgeInsets.all(10.0),
                  //     decoration: const BoxDecoration(
                  //       border: Border(
                  //         left: BorderSide(
                  //           color: Color(0xFF4ACDF9),
                  //           width: 3.0,
                  //         ),
                  //       ),
                  //       color: Colors.white,
                  //     ),
                  //     child: ListTile(
                  //       onTap: () => const LoanList().launch(context),
                  //       leading:
                  //           const Image(image: AssetImage('images/loan.png')),
                  //       title: Text(
                  //         'Loan',
                  //         maxLines: 2,
                  //         style: kTextStyle.copyWith(
                  //             color: kTitleColor, fontWeight: FontWeight.bold),
                  //       ),
                  //       trailing: const Icon(Icons.arrow_forward_ios),
                  //     ),
                  //   ),
                  // ),
                   const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                  
                    child: Container(
                      width: context.width(),
                      height: 500,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        
                        color: Colors.white,
                      ),
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
