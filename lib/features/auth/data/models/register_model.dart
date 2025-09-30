class RegisterModel {
  String? email;
  String? userName;
  String? uId;
  String? phone;

  RegisterModel({
    required this.email,
    required this.userName,
    required this.uId,
    required this.phone,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    uId = json['uId'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'userName': userName, 'uId': uId, 'phone': phone};
  }
}
