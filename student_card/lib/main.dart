import 'package:flutter/material.dart';
import 'screen_one/enter_info.dart';
import 'screen_one/Screen_Card.dart';
import '../models/Student.dart';

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
      home: ScreenCard(
        student: Student(
          id: "123456789",
          name: "name",
          phoneNumber: "09876543211",
          department: "department",
        ),
      ),
    );
  }
}
