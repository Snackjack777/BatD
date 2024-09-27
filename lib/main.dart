import 'package:batdelivery/pages/login.dart';
import 'package:batdelivery/pages/profilerider.dart';
import 'package:batdelivery/pages/profileuser.dart';
import 'package:batdelivery/pages/ridermain.dart';
import 'package:batdelivery/pages/usermain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LoginPages(),
    );
  }
}
