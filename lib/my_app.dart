import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvmis/components/login.dart';
import 'package:mvmis/components/styles.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        brightness: Brightness.dark,
        scaffoldBackgroundColor: mainBlack,
      ),
//      home: MainPage(),
    home: Login(),
    );
  }
}
