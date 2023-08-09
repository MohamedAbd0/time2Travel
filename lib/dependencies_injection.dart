import 'package:time2Travel/core/api/dio_client.dart';
import 'package:time2Travel/features/flight/domain/domain.dart';
import 'package:time2Travel/features/flight/presentation/cubit/flight_cubit.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'features/auth/auth.dart';
import 'features/flight/data/data.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
}) async {
  /// For unit testing only
  if (isUnitTest) {
    await sl.reset();
  }
  sl.registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest));
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  if (isHiveEnable) await _initHiveBoxes(isUnitTest: isUnitTest);
}

Future<void> _initHiveBoxes({bool isUnitTest = false}) async {
  await MainBoxMixin.initHive();
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<FlightsRepository>(
    () => FlightsRepositoryImpl(
      sl(),
    ),
  );
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<FlightsRemoteDatasource>(
    () => FlightsRemoteDatasourceImpl(sl()),
  );
}

void _useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostOtp(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => PostFlightSearch(sl()));
}

void _cubit() {
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl()));
  sl.registerLazySingleton(() => FlightCubit(sl()));
}
