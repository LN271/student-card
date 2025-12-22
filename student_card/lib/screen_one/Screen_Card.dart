import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/Student.dart';

class ScreenCard extends StatelessWidget {
  final Student student;
  const ScreenCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Card")),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, costraints) {
              double cardwidth;
              if (costraints.maxWidth > 600) {
                cardwidth = 500;
              } else {
                cardwidth = costraints.maxWidth * 0.9;
              }
              return Container(
                width: cardwidth,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlutterLogo(),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: const Text(
                                "University of Nineveh\n      aaasdaskfdskfds       \n      sdfdofpda",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            FlutterLogo(),
                          ],
                        ),
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
