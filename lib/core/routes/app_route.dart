import 'package:time2Travel/dependencies_injection.dart';
import 'package:time2Travel/features/flight/presentation/pages/flights_results.dart';
import 'package:time2Travel/features/flight/presentation/pages/passenger_info.dart';
import 'package:time2Travel/features/home/presentation/page/home_page.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/auth.dart';
import '../../features/flight/presentation/cubit/flight_cubit.dart';
import '../../features/general/general.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),

  /// Home Page
  home("/home"),

  /// Flight Pages
  flightsResults("/flights/results"),
  passengerInfo("/flights/passenger-info"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => const SplashScreenPage(),
      ),

      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.home.path,
      ),

      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<AuthCubit>(),
          child: const RegisterPage(),
        ),
      ),

      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<FlightCubit>(),
          child: const HomePage(),
        ),
      ),

      /// Flight Pages
      GoRoute(
        path: Routes.flightsResults.path,
        name: Routes.flightsResults.name,
        builder: (_, __) => const FlightsResultsPage(),

        
      ),

      GoRoute(
        path: Routes.passengerInfo.path,
        name: Routes.passengerInfo.name,
        builder: (_, __) => const PassengerInfoPage(),

        
      ),
    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (_, GoRouterState state) {
      final bool isLoginPage = state.matchedLocation == Routes.login.path ||
          state.matchedLocation == Routes.register.path;

      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
          false)) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page

      if (isLoginPage &&
          ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
              false)) {
        return Routes.root.path;
      }

      /// No direct
      return null;
    },
  );
}
