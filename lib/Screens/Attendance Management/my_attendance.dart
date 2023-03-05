import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
 late String errormsg;
   bool isOffice=true;
  late bool error, showprogress;
class MyAttendance extends StatefulWidget {
     String usernames,users_id;
   MyAttendance({ required this.usernames, required this.users_id, Key? key,}) : super(key: key);
  @override
  _MyAttendanceState createState() => _MyAttendanceState();
}
 
getCurrentDate() {
   
       return DateFormat('yyyy-MM-dd').format(DateTime.now());
       

}

  
String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

// void Clockin(userid) async {
//     String apiurl = "http://growfictechnology.com/voltas/api/clockin.php";

//  var data = {
//       'user_id': userid,
//       'address': 'location',
//     };

//     var response = await http.post(Uri.parse('http://growfictechnology.com/voltas/api/clockin.php'), body: json.encode(data));
//     if (response.statusCode == 200) {
//       //Server response into variable
//       print(response.body);
//       var msg = jsonDecode(response.body);
//   //  var username = msg['userInfo']['username'];
//   //  var userid = msg['userInfo']['user_id'];
 
//       //Check Login Status
//       if (msg['loginStatus'] == true) {
    
        
//       } 
//     }
//   }

getCurrenttime() {
       return DateFormat('kk:mm').format(DateTime.now());
}



class _MyAttendanceState extends State<MyAttendance> {

   String? _currentAddress;
  Position? _currentPosition;
 
   Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    var usernames1=widget.usernames;
    var userId1=widget.users_id;
   
       checkin(userid) async {
    String apiurl = "http://growfictechnology.com/voltas/api/checkin.php";

 var data = {
      'user_id': userid,
    };

    var response = await http.post(Uri.parse('http://growfictechnology.com/voltas/api/checkin.php'), body: json.encode(data));
    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      var msg = jsonDecode(response.body);
  //  var username = msg['userInfo']['username'];
  //  var userid = msg['userInfo']['user_id'];
 
      //Check Login Status
      if (msg['clockin'] == true) {
     isOffice= false;
        
      } else{
   isOffice= true;
      }
    }
  }
  checkin(userId1);
 
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Employee Directory',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white.withOpacity(0.1),
              ),
              child: const Icon(Icons.history,color: Colors.white,),
            ),
          ),
        ],
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              width: context.width(),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: kBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: context.width(),
                  
                    padding: const EdgeInsets.all(14.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text('Your Location: ${_currentAddress ?? ""}',maxLines: 3,overflow: TextOverflow.ellipsis,style: kTextStyle.copyWith(fontWeight: FontWeight.bold),),
                        const SizedBox(width: 4.0,),
                      // Text('Location Not Found ${_currentAddress ?? ""}',style: kTextStyle.copyWith(color: kGreyTextColor),),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kMainColor.withOpacity(0.1),
                          ),
                          child: const Icon(Icons.rotate_right,color: kMainColor,),
                        ),
                      ],
                    ),
                  ).onTap(_getCurrentPosition),
                  const SizedBox(height: 20.0,),
            
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white
                      ),
                      child: Column(
                        children: [
                          Text(usernames1.toString(),style: kTextStyle.copyWith(fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10.0,),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: kMainColor
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: isOffice ? Colors.white : kMainColor,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: kMainColor,
                                        child: Icon(Icons.check, color: isOffice ? Colors.white : kMainColor,),
                                      ),
                                      const SizedBox(width: 4.0,),
                                      Text('Clock In',style: kTextStyle.copyWith(color: isOffice ? kTitleColor : Colors.white),),
                                      const SizedBox(width: 12.0,),
                                    ],
                                  ),
                                ).onTap((
                                 
                                ){
                                  setState(() {
                                  var  locationplace=_currentAddress.toString();
void Clockin(userid,locations) async {
    String apiurl = "http://growfictechnology.com/voltas/api/clockin.php";

 var data = {
      'user_id': userid,
      'address': locations,
    };

    var response = await http.post(Uri.parse('http://growfictechnology.com/voltas/api/clockin.php'), body: json.encode(data));
    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      var msg = jsonDecode(response.body);
 

      //Check Login Status
      if (msg['loginStatus'] == true) {
    
        
      } 
    }
  }
                                    Clockin(userId1,locationplace);
                                    isOffice = !isOffice;
                                     toast('Clock in Successfully');
                                  
                                  });
                                }),
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: !isOffice ? Colors.white : kMainColor,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: kMainColor,
                                        child: Icon(Icons.check,color: !isOffice ? Colors.white : kMainColor,),
                                      ),
                                      const SizedBox(width: 4.0,),
                                      Text('Clock out',style: kTextStyle.copyWith(color: !isOffice ? kTitleColor : Colors.white),),
                                      const SizedBox(width: 12.0,),
                                    ],
                                  ),
                                ).onTap((){
                                  setState(() {
                                    void Clockout(userid) async {
    String apiurl = "http://growfictechnology.com/voltas/api/clockout.php";

 var data = {
      'user_id': userid,
      'address': 'location',
    };

    var response = await http.post(Uri.parse('http://growfictechnology.com/voltas/api/clockout.php'), body: json.encode(data));
    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      var msg = jsonDecode(response.body);
  //  var username = msg['userInfo']['username'];
  //  var userid = msg['userInfo']['user_id'];
 
      //Check Login Status
      if (msg['loginStatus'] == true) {
    
        
      } 
    }
  }
                                    Clockout(userId1);
                                    isOffice = !isOffice;
                                    toast('Clock out Successfully');
                                    
                                  });
                                }),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30.0,),
                          Text(greeting(),style: kTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 18.0),),
                          const SizedBox(height: 10.0,),
                          Text(getCurrentDate(),style: kTextStyle.copyWith(color: kGreyTextColor),),
                          const SizedBox(height: 10.0,),
                          Text(getCurrenttime(),style: kTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 25.0),),
                          const SizedBox(height: 30.0,),
                        
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: isOffice? kGreenColor.withOpacity(0.1) : kAlertColor.withOpacity(0.1),
                            ),
                            child: CircleAvatar(
                              radius: 80.0,
                              backgroundColor: isOffice? kGreenColor : kAlertColor,
                              child: Text(isOffice? 'Check In' : 'Check Out',style: kTextStyle.copyWith(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
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
