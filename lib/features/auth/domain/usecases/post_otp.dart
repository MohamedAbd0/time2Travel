import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/features.dart';

class PostOtp extends UseCase<User, OtpParams> {
  final AuthRepository _repo;

  PostOtp(this._repo);

  @override
  Future<Either<Failure, User>> call(OtpParams params) => _repo.otp(params);
}

class OtpParams {
  final int userID;
  final String code;
  OtpParams({required this.userID, required this.code});

  toMap() => {
        "user_id": userID,
        "otp": code,
        "app": "mobile",
        "device_type": Platform.isAndroid ? "android" : "ios",
      };
}
