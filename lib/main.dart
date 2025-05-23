import 'package:device_preview/device_preview.dart';
import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/app_cubit/app_cubit.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Splash/Views/splash_view.dart';
import 'package:drosak_management/simple_bloc_opserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocOpserver();
  runApp(
    DevicePreview(
      enabled: !isEnabled,
      builder: (context) => const DrosakManagement(),
    ),
  );
}

class DrosakManagement extends StatelessWidget {
  const DrosakManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => DatabaseCubit()),
      ],
      child: ScreenUtilInit(
        designSize: Size(SizeConfig.kWidth360, SizeConfig.kHeight690),
        minTextAdapt: true,
        splitScreenMode: true,
        // minTextAdapt: true,
        // splitScreenMode: true,
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: AppColor.secondColorBlock),
          debugShowCheckedModeBanner: false,
          routes: AppHelper.routes,
          initialRoute: SplashView.id,
        ),
      ),
    );
  }
}

bool isEnabled = true;
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
