import 'package:flutter/material.dart';
import '../screen_one/Screen_Card.dart';
import '../models/Student.dart';

class EnterInfo extends StatefulWidget {
  const EnterInfo({super.key});

  @override
  State<EnterInfo> createState() => _EnterInfoState();
}

class _EnterInfoState extends State<EnterInfo> {
  final _fromKey = GlobalKey<FormState>();
  final NameStudent = TextEditingController();
  final IDstudent = TextEditingController();
  final PhoneNumber = TextEditingController();
  String? Department;
  final address = TextEditingController();
  final age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ادخال معلومات الطالب',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/n.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _fromKey,

                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(14, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            textAlign: TextAlign.right,
                            controller: NameStudent,
                            decoration: const InputDecoration(
                              label: Text("اسم الطالب"),
                            ),
                            validator: (v) {
                              if (v!.isEmpty) {
                                return 'Please enter your name';
                              }
                              if (!RegExp(
                                r"^[\u0600-\u06FFa-zA-Z\s]+$",
                              ).hasMatch(v)) {
                                return "enter valid name";
                              }
                              return null;
                            },
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: IDstudent,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                              labelText: "رقم الهوية",
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty || v.length > 9) {
                                return ' must enter ID student';
                              }
                              if (!RegExp(r"[0-9]+$").hasMatch(v)) {
                                return "must enter number";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Directionality(
                          textDirection: TextDirection.rtl,

                          child: TextFormField(
                            textAlign: TextAlign.right,
                            controller: PhoneNumber,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              label: Text("رقم الهاتف "),
                            ),
                            validator: (v) {
                              if (v == null || v.length != 11) {
                                return ' Enter phone vaild number ';
                              }
                              if (!RegExp(r"[0-9]+$").hasMatch(v)) {
                                return "must enter number";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: DropdownButtonFormField<String>(
                            value: Department,
                            decoration: const InputDecoration(
                              labelText: "الكلية",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'تكنولوجيا المعلومات',
                                child: Text('تكنولوجيا المعلومات'),
                              ),
                              DropdownMenuItem(
                                value: 'الطب',
                                child: Text('الطب'),
                              ),
                              DropdownMenuItem(
                                value: 'القانون',
                                child: Text('القانون'),
                              ),
                              DropdownMenuItem(
                                value: 'التمريض',
                                child: Text('التمريض'),
                              ),
                              DropdownMenuItem(
                                value: 'صيدلة',
                                child: Text('صيدلة'),
                              ),
                            ],
                            onChanged:
                                (value) => setState(() => Department = value),
                            validator:
                                (value) =>
                                    value == null
                                        ? 'Please select a department'
                                        : null,
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,

                          child: TextFormField(
                            textAlign: TextAlign.right,
                            controller: address,
                            decoration: const InputDecoration(
                              labelText: 'العنوان',
                            ),
                            validator: (v) {
                              if (v!.isEmpty) {
                                return ' enter your address';
                              }
                              if (!RegExp(
                                r"^[\u0600-\u06FFa-zA-Z\s/]+$",
                              ).hasMatch(v)) {
                                return "enter valid address";
                              }
                              return null;
                            },
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,

                          child: TextFormField(
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.datetime,
                            controller: age,
                            decoration: const InputDecoration(
                              labelText: 'سنة الولدة',
                            ),
                            validator:
                                (v) => v!.isEmpty ? ' enter your age' : null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_fromKey.currentState!.validate()) {
                              final DateTime now = DateTime.now();
                              final String issue =
                                  "${now.year}/${now.month}/${now.day}";
                              final DateTime expiryDate = now.add(
                                Duration(days: 365),
                              );
                              final String expiry =
                                  "${expiryDate.year}/${expiryDate.month}/${expiryDate.day}";
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ScreenCard(
                                        student: Student(
                                          id: IDstudent.text,
                                          name: NameStudent.text,
                                          phoneNumber: PhoneNumber.text,
                                          colge: Department!,
                                          address: address.text,
                                          issueDate: issue,
                                          expiryDate: expiry,
                                          age: age.text,
                                        ),
                                      ),
                                ),
                              );
                            }
                          },
                          child: const Text("ارسال"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
