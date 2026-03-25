class Model {
  final String id;
  final String name;
  final String address;
  final String email;
  final String phone;
  final String age;
  final String department;

  Model({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.age,
    required this.department,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      age: json['age'],
      department: json['department'],
    );
  }
}
