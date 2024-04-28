class UserModel {
  String id;
  String name;
  String email;
  String role;
  String? gender;
  String? phoneNumber;
  String? photo;
  DateTime? dob;

  UserModel(
      {required this.id,
      required this.role,
      required this.name,
      required this.email,
      this.phoneNumber,
      this.photo,
      this.dob,
      this.gender});
  void printUserInfo() {
    print('ID: ${id}');
    print('Name: ${name}');
    print('Email: ${email}');
    print('Role: ${role}');
    print('Gender: ${gender ?? 'N/A'}');
    print('Phone Number: ${phoneNumber ?? 'N/A'}');
    print('Photo: ${photo ?? 'N/A'}');
    print('Date of Birth: ${dob?.toString() ?? 'N/A'}');
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["_id"] ?? "",
        name: json["full_name"] ?? "",
        email: json["email"] ?? "",
        role: json["role"] ?? "user",
        photo: json["photo"],
        gender: json["gender"],
        dob: json["dob"]);
  }
}
