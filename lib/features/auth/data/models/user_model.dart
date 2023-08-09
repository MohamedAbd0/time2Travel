import 'package:time2Travel/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.userId,
    required super.registeredEmail,
    required super.token,
    required super.privateKey,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      registeredEmail: json['registered_email'],
      token: json['token'],
      privateKey: json['privateKey'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['registered_email'] = registeredEmail;
    data['token'] = token;
    data['privateKey'] = privateKey;
    return data;
  }
}
