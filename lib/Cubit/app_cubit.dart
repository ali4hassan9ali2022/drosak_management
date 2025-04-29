import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Cubit/app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());
  int currentIndex= 0;
  PageController pageController = PageController();
  void changePageView(int index) {
    currentIndex = index;
    emit(ChangePageViewAppState());
  }

  void changeDotIndicator(int index) {
    currentIndex = index;
    emit(ChangeDotIndicatorAppState());
    pageController.animateToPage(
      currentIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  List<BottomNavigationBarItem> icons = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesPaymentIcon),
      label: "الدفع",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesAudience),
      label: "الحضور",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesStudents),
      label: "الطلاب",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesGroup),
      label: "المجموعات",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesEducationalStages),
      label: "المراحل التعليمية",
    ),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarAppState());
  }
}