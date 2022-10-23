class UserModel {
  late String email;
  late String name;
  late String phone;
  late int userGroup;
  late String registerDate;
  late String token;
  // late String address;
  // late String password;

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    userGroup = json['userGroup'];
    registerDate = json['registerDate'];
    token = json['token'];
    // address = json['address'];
  }
}
