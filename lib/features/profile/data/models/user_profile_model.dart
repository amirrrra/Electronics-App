class UserProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String email;
  final String createdAt;
  final String token;

  UserProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.email,
    required this.createdAt,
    required this.token,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      createdAt: json['created_at'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
      'email': email,
      'created_at': createdAt,
      'token': token,
    };
  }
}
