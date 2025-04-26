// import 'dart:io';
import 'package:drosak_management/Cubit/app_cubit.dart';
import 'package:drosak_management/Featured/Splash/Views/splash_view.dart';
import 'package:drosak_management/Featured/onBoarding/Views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:device_info_plus/device_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DrosakManagement());
}

class DrosakManagement extends StatelessWidget {
  const DrosakManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) => SplashView(),
          OnBoardingView.id: (context) => OnBoardingView(),
        },
        initialRoute: SplashView.id,
      ),
    );
  }
}

// Future<String?> checkWhichScreen() async {
//   String? androidVersion = await getAndroid();
//   if (androidVersion != null) {
//     if (int.parse(androidVersion) >= 12) {
//       // go to custom splash screen
//       return SplashView.id;
//     }
//   }
//   return "";
// }

// Future<String?> getAndroid() async {
//   if (Platform.isAndroid) {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     return androidInfo.version.release;
//   } else {
//     return null;
//   }
// }
