import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/API_Service.dart';
import 'core/utils/colors.dart';
import 'featuers/explore/cubit/FavoriteCubit.dart';
import 'featuers/explore/cubit/ProductCubit.dart';
import 'featuers/splash/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';


void main() {
  runApp(
      MultiBlocProvider(
        providers: [

          BlocProvider(
            create: (_) => ProductCubit(ApiService()),
          ),

          BlocProvider(
            create: (_) => FavoriteCubit(),
          ),

        ],

        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
            textTheme: GoogleFonts.poppinsTextTheme(),
      ),
        home: SplashScreen(),
    );
  }
}