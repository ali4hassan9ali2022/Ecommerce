class UserModel {
  final String id;
  final String name;
  final String image;
  final String email;
  final String password;
  final String confirePassword;

  UserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.password,
    required this.confirePassword,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      email: json["email"],
      password: json["password"],
      confirePassword: json["confirePassword"],
    );
  }
  toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "email": email,
      "password": password,
      "confirePassword": confirePassword,
    };
  }
}
