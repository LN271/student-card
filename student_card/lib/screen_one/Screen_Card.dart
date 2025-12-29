import 'dart:io';
import 'package:flutter/material.dart';
import '../models/Student.dart';

class ScreenCard extends StatelessWidget {
  final Student student;
  const ScreenCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "هوية الطالب",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width:
                    constraints.maxWidth > 600
                        ? 500
                        : constraints.maxWidth * 0.9,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 227, 227),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    _buildCard(
                      title: "هوية الطالب",
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildImageContainer(),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              children: [
                                _buildInfoRow("اسم الطالب", student.name),
                                _buildInfoRow("سنة التوليد", student.age),
                                _buildInfoRow("رقم الطالب", student.id),
                                _buildInfoRow(
                                  "رقم الهاتف",
                                  student.phoneNumber ?? "غير متوفر",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildCard(
                      title: "الدراسات الاولية",
                      content: Column(
                        children: [
                          _buildInfoRow("الكلية", student.colge),
                          _buildInfoRow("السكن", student.address),
                          _buildInfoRow("تاريخ الاصدار", student.issueDate),
                          _buildInfoRow("تاريخ الانتهاء", student.expiryDate),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget content}) {
    return Card(
      elevation: 8,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset('images/n.jpg', fit: BoxFit.contain),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    children: [
                      Text(
                        "جمهورية العراق",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "التعليم العالي والبحث العلمي",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "جامعة نينوى",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset('images/n.jpg', fit: BoxFit.contain),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 4),
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(153, 143, 3, 3),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Text(
            ": $label",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: 90,
      height: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child:
            student.imagePath != null
                ? Image.file(File(student.imagePath!), fit: BoxFit.cover)
                : Image.asset('images/n.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
