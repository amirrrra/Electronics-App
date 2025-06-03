class UserModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String email;
  final String? createdAt;
  final String? password;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.email,
    this.createdAt,
     this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      createdAt: json['created_at'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "address": address,
      "email": email,
      "password": password,
    };
  }
}
