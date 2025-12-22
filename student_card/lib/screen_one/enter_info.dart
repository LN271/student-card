import 'package:flutter/material.dart';
import 'package:student_card/models/student.dart';

class EnterInfo extends StatefulWidget {
  @override
  State<EnterInfo> createState() => _EnterInfoState();
}

class _EnterInfoState extends State<EnterInfo> {
  final _fromKey = GlobalKey<FormState>();
  final NameStudent = TextEditingController();
  final IDstudent = TextEditingController();
  final PhoneNumber = TextEditingController();
  String Department = 'Information Technology';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Information Student')),
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
              key: _fromKey,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: NameStudent,
                          decoration: const InputDecoration(
                            labelText: 'Name Student',
                          ),
                          validator:
                              (v) =>
                                  v!.isEmpty ? 'Please enter your name' : null,
                        ),
                      ),
                      TextFormField(
                        controller: IDstudent,
                        decoration: const InputDecoration(
                          labelText: 'ID Student',
                        ),
                        validator: (v) {
                          if (v!.length < 1 || v.length > 9) {
                            return ' must enter ID student';
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      TextFormField(
                        controller: PhoneNumber,
                        decoration: const InputDecoration(
                          labelText: 'Phone number',
                        ),
                        validator: (v) {
                          if (v!.length != 11) {
                            return ' Enter phone number';
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      DropdownButtonFormField(
                        value: Department,
                        items: const [
                          DropdownMenuItem(
                            value: 'Information Technology',
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
                        onChanged: (value) {
                          setState(() {
                            Department = value.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_)=>ScreenCard(
                                Student(id: IDstudent.text, name: NameStudent.text, phoneNumber: PhoneNumber.text, department: Department)

                              ),),
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
        ],
      ),
    );
  }
}
