import 'package:flutter/material.dart';
import 'package:xsalonce_mobile/screens/log_in_screen.dart';
import 'package:xsalonce_mobile/screens/register_screen.dart';
import '/screens/home_screen.dart';


void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) =>const LogInScreen(),
        '/register':(context)=>const RegisterScreen(),
        '/home':(context)=>const HomeScreen()
      },
    );
  }
}
