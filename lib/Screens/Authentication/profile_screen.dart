import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
    late String usernames='',users_id='',name='',user_contact_no='',useraddress='',useremail='',usergender='';
   ProfileScreen({Key? key, required name, required user_contact_no, required useraddress, required useremail, required usergender, required usernames, required users_id}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
     var usernames1=widget.usernames;
     var userId1=widget.users_id;
     var usergender=widget.usergender;
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
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Profile',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Image(
            image: AssetImage('images/editprofile.png'),
          ).onTap((){
            const EditProfile().launch(context);
          }),
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
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0,),
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundColor: kMainColor,
                    backgroundImage: AssetImage('images/emp1.png',),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    readOnly: true,
                    textFieldType: TextFieldType.NAME,
                    decoration:  InputDecoration(
                      labelText: 'Name',
                      hintText: widget.name,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  AppTextField(
                    readOnly: true,
                    textFieldType: TextFieldType.NAME,
                    decoration:  InputDecoration(
                      labelText: 'Email address',
                      hintText: useremail,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  AppTextField(
                    readOnly: true,
                    textFieldType: TextFieldType.EMAIL,
                    decoration:  InputDecoration(
                      labelText: 'Phone Number',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: widget.user_contact_no,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: TextEditingController(),
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: widget.useraddress,
                      labelStyle: kTextStyle,
                      border: const OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    readOnly: true,
                    decoration:  InputDecoration(
                      labelText: 'Gender',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: widget.usergender,
                      border: OutlineInputBorder(),
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
