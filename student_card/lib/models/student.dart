class Student {
  final String id;
  final String name;
  final String colge;
  final String? phoneNumber;
  final String address;
  final String age;
  final String issueDate;
  final String expiryDate;
  final String? imagePath;

  Student({
    required this.id,
    required this.name,
    required this.colge,
    required this.address,
    required this.age,
    required this.issueDate,
    required this.expiryDate,
     this.imagePath,
     this.phoneNumber,
  });
}
