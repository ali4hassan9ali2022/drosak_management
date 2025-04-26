import 'package:drosak_management/Featured/Splash/Views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DrosakManagement());
}

class DrosakManagement extends StatelessWidget {
  const DrosakManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.id : (context)=> SplashView(),
      },
      initialRoute: SplashView.id,
    );
  }
}