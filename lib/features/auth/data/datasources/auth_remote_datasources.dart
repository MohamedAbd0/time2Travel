import 'package:dartz/dartz.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/auth/auth.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, UserModel>> register(
    RegisterParams registerParams,
  );

  Future<Either<Failure, UserModel>> login(LoginParams loginParams);

  Future<Either<Failure, UserModel>> otp(OtpParams otpParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, UserModel>> register(
    RegisterParams registerParams,
  ) async {
    final response = await _client.postRequest(
      ListAPI.register,
      data: registerParams.toMap(),
      converter: (response) =>
          UserModel.fromJson(response["data"] as Map<String, dynamic>),
    );
    return response;
  }

  @override
  Future<Either<Failure, UserModel>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: loginParams.toMap(),
      converter: (response) =>
          UserModel.fromJson(response["data"] as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, UserModel>> otp(OtpParams otpParams) async {
    final response = await _client.postRequest(
      ListAPI.otp,
      data: otpParams.toMap(),
      converter: (response) =>
          UserModel.fromJson(response["data"] as Map<String, dynamic>),
    );
    return response;
  }
}
