part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  final User? user;
  final int? userID;
  final String? error;

  const AuthState({
    this.user,
    this.userID,
    this.error,
  });

  @override
  List<Object?> get props => [user, error, userID];
}

class AuthStateInit extends AuthState {
  const AuthStateInit();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateSuccess extends AuthState {
  const AuthStateSuccess({super.user});
}

class AuthStateVerifyOtp extends AuthState {
  const AuthStateVerifyOtp({super.userID});
}

class AuthStateFailed extends AuthState {
  const AuthStateFailed({super.error});
}
