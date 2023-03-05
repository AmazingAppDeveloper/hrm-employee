import 'package:flutter/material.dart';
import 'package:hrm_employee/Screens/Salary%20Management/salary_statement_details.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class SalaryStatementList extends StatefulWidget {
  const SalaryStatementList({Key? key}) : super(key: key);

  @override
  _SalaryStatementListState createState() => _SalaryStatementListState();
}

class _SalaryStatementListState extends State<SalaryStatementList> {

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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
          'Loan List',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Text(
                    selectedDate.day.toString()+'/'+selectedDate.month.toString()+'/'+selectedDate.year.toString(),
                    style: kTextStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ).onTap(()=> _selectDate(context)),
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
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: GestureDetector(
                      onTap: (){
                        const SalaryStatementDetails().launch(context);
                      },
                      child: Container(
                        width: context.width(),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: kMainColor,
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Personal Loan',
                                  maxLines: 2,
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text('16,000',style: kTextStyle.copyWith(fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 8.0,),
                                    Container(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0,bottom: 4.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: kMainColor,
                                      ),
                                      child: Text('View',style: kTextStyle.copyWith(color: Colors.white),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
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

