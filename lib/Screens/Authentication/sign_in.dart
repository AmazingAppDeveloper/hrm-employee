
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrm_employee/Screens/Authentication/sign_up.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Home/home_screen.dart';
import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final TextEditingController controller = TextEditingController();
   bool _visible = false;
   final userController = TextEditingController();
  final pwdController = TextEditingController();
  bool isChecked = false;
  Future userLogin() async {
    if(userController.text==null && pwdController.text==null){
toast('Something went wrong!!!');
    }else{
    final prefs = await SharedPreferences.getInstance();
    //Login API URL
    //use your local IP address instead of localhost or use Web API
    String url = "http://growfictechnology.com/voltas/api/voltas_login.php";

    // Showing LinearProgressIndicator.
    setState(() {
      _visible = true;
    });
    

    // Getting username and password from Controller
    var data = {
      'username': userController.text,
      'password': pwdController.text,
    };

    //Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      var msg = jsonDecode(response.body);
  
       
      //Check Login Status
      if (msg['loginStatus'] == true) {
         var username = msg['userInfo']['username'];
   var userid = msg['userInfo']['user_id'];
    var name = msg['userInfo']['first_name']+" "+msg['userInfo']['last_name'];
     var useremail = msg['userInfo']['email'];
    
      var user_contact_no = msg['userInfo']['contact_no'];
       var useraddress = msg['userInfo']['address'];
        var usergender = msg['userInfo']['gender'];
        setState(() {
          //hide progress indicator
          _visible = false;
        });
        

        // Navigate to Home Screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen( usernames: username,users_id : userid,name :name,useremail:useremail,user_contact_no: user_contact_no,useraddress: useraddress,usergender: usergender
              
            )));
      } else {
        setState(() {
          //hide progress indicator
          _visible = false;

          //Show Error Message Dialog
         
          toast(msg["message"]);
        });
      }
    } else {
      setState(() {
        //hide progress indicator
        _visible = false;

        //Show Error Message Dialog
        _showToast(context,"Error during connecting to Server.");
      });
    }
  }
  }

final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'LOGIN',
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body:  Form(
              key: _formKey,
              child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Please Sign in to continue',
              style: kTextStyle.copyWith(color: Colors.white),
            ),
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
                   Image.asset(
                'images/logo_main.jpg',
                height: 150,
                width: 300,
              ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  
                  SizedBox(
                    height: 60.0,
                    child: AppTextField(
                    controller: userController,
                    textFieldType: TextFieldType.USERNAME,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: kTextStyle,
                      hintText: 'Enter Username',
                      border: const OutlineInputBorder(),
                    ),validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter User Name';
                          }
                          return null;
                        },
                  ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                     controller: pwdController,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: kTextStyle,
                      hintText: 'Enter password',
                      border: const OutlineInputBorder(),
                    ),validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Row(
                  //   children: [
                  //     Transform.scale(
                  //       scale: 0.8,
                  //       child: CupertinoSwitch(
                  //         value: isChecked,
                  //         activeColor: kMainColor,
                  //         thumbColor: kGreyTextColor,
                  //         onChanged: (bool value) {
                  //           setState(() {
                  //             isChecked = value;
                  //           });
                  //         },
                  //       ),
                  //     ),
                  //     Text(
                  //       'Save Me',
                  //       style: kTextStyle,
                  //     ),
                  //     const Spacer(),
                  //     Text(
                  //       'Forgot Password?',
                  //       style: kTextStyle,
                  //     ).onTap(() {
                  //       const ForgotPassword().launch(context);
                  //     }),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                    buttontext: 'LOGIN',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                
                    onPressed: () => {
                          // Validate returns true if the form is valid, or false otherwise.
                       userLogin()
                    }
                   
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: 'Don\'t have an account? ',
                  //         style: kTextStyle.copyWith(
                  //           color: kGreyTextColor,
                  //         ),
                  //       ),
                  //       WidgetSpan(
                  //         child: Text(
                  //           'Sign Up',
                  //           style: kTextStyle.copyWith(
                  //             fontWeight: FontWeight.bold,
                  //             color: kMainColor,
                  //           ),
                  //         ).onTap((){
                  //           const SignUp().launch(context);
                  //         }),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
   void _showToast(BuildContext context,message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text(message),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
