import 'package:flutter/material.dart';
import 'package:hrm_employee/Screens/Authentication/sign_in.dart';
import 'package:hrm_employee/Screens/Employee%20Directory/dynamicform.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Add the line below to get horizontal sliding transitions for routes.
        pageTransitionsTheme: const PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
      ),
      title: 'Universal',
      home: const SignIn(),
    );
  }
}
