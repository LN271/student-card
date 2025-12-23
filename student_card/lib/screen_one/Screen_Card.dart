import 'package:flutter/material.dart';
import '../models/Student.dart';

class ScreenCard extends StatelessWidget {
  final Student student;
  const ScreenCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "هوية الطالب",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
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
                      color: const Color.fromARGB(10, 0, 0, 0),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Card(
                      color: Color.fromARGB(197, 245, 250, 236),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    'images/n.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "جمهورية العراق",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        " التعليم العالي والبحث العلمي",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "جامعة نينوى",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    'images/n.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 500,
                              color: Color.fromARGB(153, 143, 3, 3),
                              child: Text(
                                " الدراسات الاولية",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Column(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "الكلية: ${student.colge}  ",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "السكن  : ${student.address}",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "تريخ الاصدار  : ${student.issueDate}",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "تاريخ الانتهاء  : ${student.expiryDate}",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color.fromARGB(197, 245, 250, 236),

                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    'images/n.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "جمهورية العراق",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        " التعليم العالي والبحث العلمي",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "جامعة نينوى",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    'images/n.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 500,
                              color: Color.fromARGB(153, 143, 3, 3),
                              child: Text(
                                "هوية الطالب",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            Column(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "اسم الطالب: ${student.name}",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "سنة التوليد : ${student.age}",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "رقم الطالب: ${student.id}",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: ListTile(
                                    title: Text(
                                      "رقم الهاتف: ${student.phoneNumber ?? "N/A"}",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
}
