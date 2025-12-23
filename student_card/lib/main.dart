import 'package:flutter/material.dart';
import 'screen_one/enter_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student ID ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EnterInfo(),
    );
  }
}
