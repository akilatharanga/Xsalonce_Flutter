import 'package:flutter/material.dart';
import 'package:xsalonce_mobile/screens/log_in_screen.dart';
import 'package:xsalonce_mobile/screens/map_screen.dart';
import 'package:xsalonce_mobile/screens/register_screen.dart';
import 'package:xsalonce_mobile/screens/search_box.dart';
import 'package:xsalonce_mobile/screens/search_by_location.dart';
import '/screens/home_screen.dart';
import 'package:xsalonce_mobile/screens/search_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => const SearchBox(),
        // '/register':(context)=>const RegisterScreen(),
        '/':(context)=>const HomeScreen(),
        // '/search':(context)=>const SearchBox(),
        // '/map_screen':(context)=>const MapScreen(),
        // '/':(context)=>const MapScreen(),
      },

    );
  }
}
