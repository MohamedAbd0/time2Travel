// ignore_for_file: file_names
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/dependencies_injection.dart';
import 'package:time2Travel/features/flight/presentation/cubit/flight_cubit.dart';
import 'package:time2Travel/utils/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/auth/auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()),
        BlocProvider(create: (_) => sl<FlightCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, __) {
          AppRoute.setStream(context);

          return MaterialApp.router(
              routerConfig: AppRoute.router,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              title: Constants.get.appName,
              locale: const Locale("en"),
              themeMode: ThemeMode.light,
              theme: ThemeData(
                primaryColor: Palette.primary,
                iconTheme: const IconThemeData(color: Palette.primary),
                primaryIconTheme: const IconThemeData(color: Palette.primary),
              ));
        },
      ),
    );
  }
}
