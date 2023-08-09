import 'package:dartz/dartz.dart';
import 'package:time2Travel/features/features.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/utils/services/hive/hive.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, User>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        return Right(loginResponse);
      },
    );
  }

  @override
  Future<Either<Failure, User>> register(
    RegisterParams registerParams,
  ) async {
    final response = await authRemoteDatasource.register(registerParams);
    return response.fold(
      (failure) => Left(failure),
      (registerResponse) {
        return Right(registerResponse);
      },
    );
  }

  @override
  Future<Either<Failure, User>> otp(OtpParams otpParams) async {
    final response = await authRemoteDatasource.otp(otpParams);

    return response.fold(
      (failure) => Left(failure),
      (otpResponse) {
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(MainBoxKeys.token, otpResponse.token);
        mainBoxMixin.addData(MainBoxKeys.userId, otpResponse.userId);
        return Right(otpResponse);
      },
    );
  }
}
