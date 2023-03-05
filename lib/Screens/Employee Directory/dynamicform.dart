import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';
class DynamicForm extends StatefulWidget {
  const DynamicForm({Key? key}) : super(key: key);

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  late int _count;
     String gender = 'Male';
          String activity = 'Civil';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _count=0;
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
   DropdownButton<String> getActivity() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String activity in ActivityList) {
      var item = DropdownMenuItem(
        child: Text(activity),
        value: activity,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: activity,
      onChanged: (value) {
        setState(() {
          activity = value!;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(title: Text("Project name: 25002"),
        actions: [
IconButton(onPressed: ()async{
setState(() {
  _count++;
});
}, icon: Icon(Icons.add)),
IconButton(onPressed: ()async{
setState(() {
  _count=0;
});
}, icon: Icon(Icons.refresh)),
        ],
        ),

        body: Container(padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
                 Flexible(child: ListView.builder(
         
              shrinkWrap: true,
              itemCount: _count,
              itemBuilder: (context,index){
           
return _row(index);
            },),),
            
           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Add Contractors :'),
                    ElevatedButton(
                      onPressed:()async{
setState(() {
  _count++;
});
},
                      child: const Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: ()async{
setState(() {
  _count=0;
});
},
                      child: const Text('Remove'),
                    ),
                  ],
                ), ],
          
        ), ),
      );
  }

  _row(int index){
  
    return Row(  
      children: [
         
     SizedBox( height: 80,),
      Expanded(
        
        child: Column(children: [
            const SizedBox(height: 30.0,),
                          Text('Work ' +(index+1).toString(),style: kTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 20.0),),
                          const SizedBox(height: 20.0,),
           const SizedBox(height: 20.0,),
                          SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Select Acitivity',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getActivity()),
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
                              labelText: 'Select Plan',
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
                              labelText: 'Select UOM',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getGender()),
                        );
                      },
                    ),
                  ),  const SizedBox(height: 20.0,),
                          AppTextField(
                            textFieldType: TextFieldType.PHONE,
                            maxLines: 4,
                        
                          //  controller: descController,
                            decoration: const InputDecoration(
                              
                              labelText: 'Quantity',
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
                              labelText: 'Select Contractor',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getGender()),
                        );
                      },
                    ),
                  ),
        ],)
      ),
    
    ],);}
  }
