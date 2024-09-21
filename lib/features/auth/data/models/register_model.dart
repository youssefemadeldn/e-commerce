import 'package:e_commerce/features/auth/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({super.message, super.user, super.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['message'] = this.message;
  //   data['statusMsg'] = this.statusMsg;
  //   if (this.user != null) {
  //     data['user'] = this.user!.toJson();
  //   }
  //   data['token'] = this.token;
  //   return data;
  // }
}

class UserModel extends UserEntity {
  String? role;

  UserModel({super.name, super.email, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
