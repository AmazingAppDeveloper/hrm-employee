// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrm_employee/Screens/Employee%20Directory/employee_directory_screen.dart';
import 'package:hrm_employee/Screens/Home/home_screen.dart';
import 'package:hrm_employee/Screens/Notification/notification_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
  late String errormsg,message;
  late bool error, showprogress;
  var assigned_too;
  String _mySelection="Line Survey",planid="";
 bool _isVisible = false;
  String filename="",paths="";
 String filepath="";
   String gender = 'Male';
      String work="";
      String plan="13",u="Mtr",con="Line Survey";
     
        var data;
      late  CityOne cityOne;
    
     
    String url= "http://growfictechnology.com/voltas/api/dropdownactivity.php";
    
    String url2= "http://growfictechnology.com/voltas/api/uomdropdown.php";
class EmployeeDetails extends StatefulWidget {
  

  final String email,contact_no,date_of_birth,first_name,task_id,user_id;
      late String errormsg;
  late bool error, showprogress;


   EmployeeDetails( {required  this.email,required  this.first_name, required this.contact_no, required this.date_of_birth, required this.task_id, required this.user_id,Key? key,}) : super(key: key);

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();

}
Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "http://growfictechnology.com/voltas/api/employeefetch.php",
    );

    final data = response.data;
    if (data != null) {
      final parsed = json.decode(response.data).cast<Map<String, dynamic>>();
     return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
    }

    return [];
}
  
class _EmployeeDetailsState extends State<EmployeeDetails> {
   TextEditingController name = TextEditingController();

    TextEditingController firstDate = TextEditingController();
  TextEditingController secondDate = TextEditingController();
  TextEditingController lastDate = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
    List allTextField = [];
  late File _file;

   final descController = TextEditingController();
 //final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();
    final _userEditTextController = TextEditingController(text: '');

  @override
  void initState() {
    error = false;
    message = "";
       String _mySelection="Measurement";

    work = "LT Network"; //default country
    super.initState();
  }

Future<void> getCity() async {
        var res = await http.post(Uri.parse(url));
        //attache countryname on parameter country in url
        if (res.statusCode == 200) {
            setState(() {
      
                 data = json.decode(res.body);
                //  if (data['error'] == "true") {
                //      //check fi there is any error from server.
                //      error = "true";
                //     //  message = data['error'];
                //     print('error');
                //  }SQL DATA
                _isVisible=true;
            });
        }else{
           //there is error
           setState(() {
               error = true;
               message = "Error during fetching data";
           });
        }
  }
Future<void> getuom() async {
        var res = await http.post(Uri.parse(url));
        //attache countryname on parameter country in url
        if (res.statusCode == 200) {
            setState(() {
      
                 data = json.decode(res.body);
                //  if (data['error'] == "true") {
                //      //check fi there is any error from server.
                //      error = "true";
                //     //  message = data['error'];
                //     print('error');
                //  }SQL DATA
                _isVisible=true;
            });
        }else{
           //there is error
           setState(() {
               error = true;
               message = "Error during fetching data";
           });
        }
  }

DropdownButton<String> getGender() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String gender in genderList) {
      var item = DropdownMenuItem(
        child: Text(gender),
        value: gender,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );
  }

  
DropdownButton<String> getPlans() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String plan in planList) {
      var item = DropdownMenuItem(
        child: Text(plan),
        value: plan,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: plan,
      onChanged: (value) {
        setState(() {
          plan = value!;
        });
      },
    );
  }

  
DropdownButton<String> GetUOM() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String u in UOM) {
      var item = DropdownMenuItem(
        child: Text(u),
        value: u,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: u,
      onChanged: (value) {
        setState(() {
          u = value!;
        });
      },
    );
  }
DropdownButton<String> getContractor() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String con in Contractor) {
      var item = DropdownMenuItem(
        child: Text(con),
        value: con,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: con,
      onChanged: (value) {
        setState(() {
          con = value!;
        });
      },
    );
  }





  
Widget cityList(){ 
  //widget function for city list
      List<CityOne> citylist = List<CityOne>.from(
         data["data"].map((i){
         return CityOne.fromJSON(i);
         })
      ); //searilize citylist json data to object model.

     return DropdownButton(
             //   hint: Text("Select Plans"),
                isExpanded: true,
             //   value: "Measurement",
value: plan,
                 
                
                items: citylist.map((cityOne){
                
                   return DropdownMenuItem(
                    value: cityOne.id,
                 
                        child: Text(cityOne.name),

                      
                       
                     );
                }).toList(),
               onChanged: (value){ 
                
setState(() {
plan=value.toString();
   print(value);
                });
               
                },
            ); 
  }

  @override
  Widget build(BuildContext context) {
   
     var task_id=widget.task_id;
       var user_id=widget.user_id;
      
      var file_description= descController.text;
     Future uploadFile() async {
  

print("here is assigned"+assigned_too);
  FilePickerResult? result = await FilePicker.platform.pickFiles();
var dio = Dio();
  if(result!=null){
    File file = File(result.files.single.path ?? " ");

     filename = file.path.split('/').last;

     filepath = file.path;

  }else {
    print("Result is null");
  }
}
   

Future<void> _pickFile() async {
        toast("Data Uploaded Successfully");
  if(file_description!=null && assigned_too!=null && filepath!=null){
        var request =await http.MultipartRequest("POST", Uri.parse("http://growfictechnology.com/voltas/api/taskinfoupload.php"));
        request.fields["task_id"] = task_id;
         request.fields["upload_by"] = user_id;
          request.fields["file_description"] = file_description;
           request.fields["assigned_too"] = assigned_too;
        request.headers["Authorization"] = "";
        descController.clear();
          _userEditTextController.clear();
        
        
        // var multipartFile = http.MultipartFile.fromPath('file', (filepath),
        // filename: filename);
        // request.files.add(multipartFile);
          var multipartFile = await http.MultipartFile.fromPath(
          'file', filepath); //returns a Future<MultipartFile>
      request.files.add(multipartFile);
        var response = await request.send();
        var responseData = await response.stream.toBytes();
        var result = String.fromCharCodes(responseData);
        print(result);

  
          // Navigator.push(
          //                  context, MaterialPageRoute(builder: (context) => HomeScreen(users_id: user_id,usernames: 'User')));
                        
     }else{
toast("All fields are mandatory!!");
     }}
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading:Icon(Icons.work,color: Colors.white,),
          title: Text(widget.email,style: kTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
          //subtitle:  Text(widget.email,style: kTextStyle.copyWith(color: Colors.white.withOpacity(0.5)),),
          trailing: const Icon(Icons.close,color: Colors.blueAccent,),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,

        child:Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
          const SizedBox(
            height: 10.0,
          ),
          // Expanded(
            // child: 
            Container(
              width: context.width(),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Color(0xFFFAFAFA),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
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
                          Text('Work',style: kTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 20.0),),
                       
                              const SizedBox(height: 20.0,),
                        DropdownButton(
                                isExpanded: true,
                               
                                value: work,
                                hint: Text("Select Plan"),
                                items: ActivityList.map((work){
                                  return DropdownMenuItem(
                                    child: Text(work), //label of item
                                    value: work, //value of item
                                  );
                                 }).toList(), 
                                 onChanged: (value){
_isVisible = true;
                                     work = value.toString(); //change the country name
                                   getCity(); //get city list.
                                 },
                            ),
                          Container( //wrapper for City list
                         margin: EdgeInsets.only(top:30),
                         child:error?Text(message):
                               data == null?
                               Text("Choose plan"):
                               cityList(),
                               //if there is error then show error message,
                               //else check if data is null,
                               //if not then show city list,
                               
                     )
                   ,
                    
   
                     const SizedBox(height: 20.0,),
                          AppTextField(
                            textFieldType: TextFieldType.PHONE,
                            maxLines: 4,
                        
                           controller: descController,
                            decoration: const InputDecoration(
                              
                              labelText: 'Quanity',
                              hintText: 'Write here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                      const SizedBox(height: 20.0,),     
                        
                          SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'UOM',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getGender()),
                        );
                      },
                    ),
                  ),
                  
                          const SizedBox(height: 20.0,),
                   SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Contractor',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getContractor()),
                        );
                      },
                    ),
                  ),
                  
                          const SizedBox(height: 20.0,),
              ButtonGlobal(
                    buttontext: 'Submit',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                
                    onPressed: () => {
                         Navigator.push(
            context, MaterialPageRoute(builder: (context) => NotificationScreen(           
            )))
                  
                    }
                   
                  ),
                        ],

                      ),
                    ),
                  ),
                ],
              ),
            ),
          // ),
        ],
      ),
    )));
  }
  

}
class CityOne{
  String id, name;
  CityOne({required this.id, required this.name,});

  factory CityOne.fromJSON(Map<String, dynamic> json){
     return CityOne(
       id:json["id"],
       name: json["name"],
     );
  }
}
class UserModel {
  final String user_id;

  final String first_name;
  
  UserModel(
      {required this.user_id,  required this.first_name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_id: json["user_id"],
      first_name: json["first_name"]+" "+json["last_name"],
   
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.user_id} ${this.first_name}';
  }

  ///this method will prevent the override of toString
 

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return this.user_id == model.user_id;
  }

  @override
  String toString() => user_id;
}

class contractor {
   String cid;
  String cname;
  String qty;

  contractor({this.cname = '', this.qty = '', this.cid = ''});
}


