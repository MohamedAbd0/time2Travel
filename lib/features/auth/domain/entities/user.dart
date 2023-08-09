// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class User extends Equatable implements Comparable<User> {
  final int? userId;
  final String? registeredEmail;
  final String? token;
  final String? privateKey;

  const User({this.userId, this.registeredEmail, this.token, this.privateKey});

  @override
  List<Object?> get props => [
        userId,
        registeredEmail,
        privateKey,
        token,
      ];

  @override
  int compareTo(User other) {
    return registeredEmail!.compareTo(other.registeredEmail!);
  }
}
