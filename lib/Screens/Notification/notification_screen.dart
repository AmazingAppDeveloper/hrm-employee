import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Chat/Model/lms_model.dart';
import '../Chat/Util/data_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // ignore: non_constant_identifier_names
  List<LMSModel> list_data = maanGetChatList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: kMainColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Notification',
            style: kTextStyle.copyWith(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

               const SizedBox(height: 20.0,),
                Container(
                width: context.width(),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        const SizedBox(height: 5.0,),
                 ButtonGlobal(
                    buttontext: 'Add More',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                
                    onPressed: () => {
                          // Validate returns true if the form is valid, or false otherwise.
                          // NotificationScreen( ).launch(context)
                    }
                   
                  ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Work ',style: kTextStyle.copyWith(color: kTitleColor,fontSize: 20.0,fontWeight: FontWeight.bold),),
                    ),
                    Column(
                      children: [


                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
