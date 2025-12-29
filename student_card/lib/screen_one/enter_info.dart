// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'dart:io';
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
  File? _selectedImage;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  // ignore: unused_element
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
          Positioned.fill(
            child: Image.asset('images/n.jpg', fit: BoxFit.cover),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _fromKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              _selectedImage != null
                                  ? FileImage(_selectedImage!)
                                  : null,
                          child:
                              _selectedImage == null
                                  ? Icon(
                                    Icons.add_a_photo,
                                    size: 40,
                                    color: Colors.grey[700],
                                  )
                                  : null,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'اضغط لرفع الصورة ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _bulidTextField(
                        controller: NameStudent,
                        label: "اسم الطالب",
                        validator:
                            (v) =>
                                v!.isEmpty
                                    ? 'يرجى ادخال الاسم'
                                    : (!RegExp(
                                          r"^[\u0600-\u06FFa-zA-Z\s]+$",
                                        ).hasMatch(v)
                                        ? "اسم غير صالح"
                                        : null),
                      ),
                      _bulidTextField(
                        controller: IDstudent,
                        label: "رقم الهوية",
                        isNumber: true,
                        validator:
                            (v) =>
                                (v == null || v.length > 9)
                                    ? 'تأكد من رقم الهوية'
                                    : null,
                      ),
                      _bulidTextField(
                        controller: PhoneNumber,
                        label: "رقم الهاتف",
                        isNumber: true,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return null;
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                            return 'يجب إدخال أرقام فقط';
                          }
                          if (v.length != 11) {
                            return 'يجب أن يكون الرقم 11 مرتبة';
                          }
                          return null;
                        },
                      ),
                      _bulidTextField(
                        controller: address,
                        label: "العنوان",
                        validator:
                            (v) => v!.isEmpty ? 'يرجى ادخال العنوان' : null,
                      ),
                      _bulidTextField(
                        controller: age,
                        label: "سنة التوليد",
                        isNumber: true,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'يرجى ادخال سنة التوليد';
                          }
                          if (!RegExp(r'^[0-9/]+$').hasMatch(v)) {
                            return 'ادخال رقم صحيح ';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: DropdownButtonFormField<String>(
                            value: Department,
                            decoration: const InputDecoration(
                              labelText: "الكلية",
                            ),
                            items:
                                [
                                      'تكنولوجيا المعلومات',
                                      'الطب',
                                      'القانون',
                                      'التمريض',
                                      'صيدلة',
                                    ]
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      ),
                                    )
                                    .toList(),
                            onChanged:
                                (value) => setState(() => Department = value),
                            validator:
                                (value) =>
                                    value == null ? 'يرجى اختيار الكلية' : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 10,
                          ),
                        ),
                        onPressed: _submitForm,
                        child: const Text(
                          "ارسال",
                          style: TextStyle(fontSize: 18),
                        ),
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

  Widget _bulidTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 5),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.right,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              validator: validator,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_fromKey.currentState!.validate()) {
      final now = DateTime.now();
      final expiryDate = now.add(const Duration(days: 365 * 2));
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
                  issueDate: "${now.year}/${now.month}/${now.day}",
                  expiryDate:
                      "${expiryDate.year}/${expiryDate.month}/${expiryDate.day}",
                  age: age.text,
                  imagePath: _selectedImage?.path,
                ),
              ),
        ),
      );
    }
  }
}
