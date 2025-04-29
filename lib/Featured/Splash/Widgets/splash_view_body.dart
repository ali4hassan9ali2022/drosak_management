import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Featured/Splash/Widgets/sliding_image_bottom_right.dart';
import 'package:drosak_management/Featured/Splash/Widgets/sliding_image_logo.dart';
import 'package:drosak_management/Featured/Splash/Widgets/sliding_image_top.dart';
import 'package:drosak_management/Featured/onBoarding/Views/on_boarding_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationBottom;
  late Animation<Offset> animationTop;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    animationImage();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff18171C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SlidingImageTop(position: animationTop),
          SlidingImageLogo(animation: animation),
          SlidingImageBottomRight(position: animationBottom),
        ],
      ),
    );
  }

  void animationImage() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        AppHelper.navgatorpushNamedAndRemoveUntil(context, pushNamed: OnBoardingView.id, isRoute: false);
      }
    });
    animationBottom = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    animationTop = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    animation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    animationController.forward();
  }
}

