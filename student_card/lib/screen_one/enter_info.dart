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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Information Student'),
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
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: NameStudent,
                            decoration: const InputDecoration(
                              labelText: 'Name Student',
                            ),
                            validator:
                                (v) =>
                                    v!.isEmpty
                                        ? 'Please enter your name'
                                        : null,
                          ),
                        ),
                        TextFormField(
                          controller: IDstudent,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'ID Student',
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty || v.length > 9) {
                              return ' must enter ID student';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        TextFormField(
                          controller: PhoneNumber,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone number',
                          ),
                          validator: (v) {
                            if (v == null || v.length != 11) {
                              return ' Enter phone number';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        DropdownButtonFormField<String>(
                          // hint: const Text('Select Department'),
                          value: Department,
                          decoration: const InputDecoration(
                            labelText: "Department",
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'IT',
                              child: Text('Information Technology'),
                            ),
                            DropdownMenuItem(
                              value: 'Medicine',
                              child: Text('Medicine'),
                            ),
                            DropdownMenuItem(value: 'Law', child: Text('Law')),
                            DropdownMenuItem(
                              value: 'Nursing',
                              child: Text('Nursing'),
                            ),
                            DropdownMenuItem(
                              value: 'Pharmacy',
                              child: Text('Pharmacy'),
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
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_fromKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ScreenCard(
                                        student: Student(
                                          id: IDstudent.text,
                                          name: NameStudent.text,
                                          phoneNumber: PhoneNumber.text,
                                          department: Department!,
                                        ),
                                      ),
                                ),
                              );
                            }
                          },
                          child: const Text("submit"),
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
