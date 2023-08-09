import 'package:dartz/dartz.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/auth/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(LoginParams loginParams);
  Future<Either<Failure, User>> register(RegisterParams registerParams);
  Future<Either<Failure, User>> otp(OtpParams otpParams);
}
