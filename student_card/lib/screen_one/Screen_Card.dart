import 'package:flutter/material.dart';
import '../models/Student.dart';
class ScreenCard extends StatelessWidget {
  final Student student;
  const ScreenCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Card")),
      body: LayoutBuilder(
        builder: (context, costraints) {
          double width = costraints.maxWidth > 500 ? 400 : 320;
          return Card(elevation: 8,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: width,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("University of Nineveh",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold ),),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(student.name),
                  subtitle: const Text("Name Student"),
                ),
                ListTile(
                  leading: const Icon(Icons.badge),
                  title: Text(student.id),
                  subtitle: const Text("Student ID"),
                ),
                ListTile(
                  leading: const Icon(Icons.school),
                  title: Text(student.department),
                  subtitle: const Text("Department"),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(student.phoneNumber ?? "N/A"),
                  subtitle: const Text("Name Student"),
                ),
              ],
            ),
          ),);
        },
      ),
    );
  }
}
