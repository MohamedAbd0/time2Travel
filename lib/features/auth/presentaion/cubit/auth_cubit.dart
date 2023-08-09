import 'package:equatable/equatable.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/features.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin, this._postOtp, this._postRegister)
      : super(const AuthStateInit());

  final PostLogin _postLogin;
  final PostOtp _postOtp;
  final PostRegister _postRegister;

  Future<void> login(LoginParams params) async {
    try {
  emit(const AuthStateLoading());
  final data = await _postLogin.call(params);
  
  data.fold(
    (l) {
      if (l is ServerFailure) {
        emit(AuthStateFailed(error: l.message.toString()));
      }
    },
    (r) => emit(AuthStateVerifyOtp(userID: r.userId)),
  );
}  catch (e) {
        emit(AuthStateFailed(error: e.toString()));
}
  }

  Future<void> register(RegisterParams params) async {
    try {
  emit(const AuthStateLoading());
  final data = await _postRegister.call(params);
  
  data.fold(
    (l) {
      if (l is ServerFailure) {
        emit(AuthStateFailed(error: l.message.toString()));
      }
    },
    (r) => emit(AuthStateVerifyOtp(userID: r.userId)),
  );
}  catch (e) {
        emit(AuthStateFailed(error: e.toString()));}
  }

  Future<void> otp(OtpParams params) async {
    try {
  emit(const AuthStateLoading());
  final data = await _postOtp.call(params);
  
  data.fold(
    (l) {
      if (l is ServerFailure) {
        emit(AuthStateFailed(error: l.message.toString()));
      }
    },
    (r) => emit(AuthStateSuccess(user: r)),
  );
} catch (e) {
    emit(AuthStateFailed(error: e.toString()));
}
  }

  Future<void> logout() async {
    emit(const AuthStateLoading());
    await MainBoxMixin().logoutBox();
    emit(const AuthStateSuccess());
  }
}
