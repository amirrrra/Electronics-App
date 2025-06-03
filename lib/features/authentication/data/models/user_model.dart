class UserModel {
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final String address;

  UserModel({
    required this.fname,
    required this.lname,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fname: json['first_name'],
      lname: json['last_name'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': fname,
      'last_name': lname,
      'phone': phone,
      'address': address,
      'email': email,
    };
  }
}
