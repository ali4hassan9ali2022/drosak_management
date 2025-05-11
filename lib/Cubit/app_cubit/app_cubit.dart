import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Cubit/app_cubit/app_state.dart';
import 'package:drosak_management/Featured/Layout/Views/attendance_view.dart';
import 'package:drosak_management/Featured/Layout/Views/educational_stages_view.dart';
import 'package:drosak_management/Featured/Layout/Views/groub_view.dart';
import 'package:drosak_management/Featured/Layout/Views/payment_view.dart';
import 'package:drosak_management/Featured/Layout/Views/students_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());
  int currentIndex = 0;
  PageController pageController = PageController();
  PageController pageMainController = PageController();
  // bool hasMainView = false;
  // void initMainView(int index) {
  //   if(!hasMainView) {
  //     changeBottomNavBar(index);
  //     hasMainView = true;
  //   }
  // }

  // void resetMainView() {
  //   hasMainView = false;
  // }
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
      activeIcon: SvgPicture.asset(
        Assets.imagesPaymentIcon,
        colorFilter: ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(Assets.imagesEducationalStages),
      label: "المراحل التعليمية",
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.imagesPaymentIcon,
        colorFilter: ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(Assets.imagesGroup),
      label: "المجموعات",
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.imagesPaymentIcon,
        colorFilter: ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(Assets.imagesStudents),
      label: "الطلاب",
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.imagesPaymentIcon,
        colorFilter: ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(Assets.imagesAudience),
      label: "الحضور",
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.imagesPaymentIcon,
        colorFilter: ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        Assets.imagesPaymentIcon,
        colorFilter: ColorFilter.mode(Color(0xff1e1e1e), BlendMode.srcIn),
      ),
      label: "الدفع",
    ),
  ];
  List<String> titles = [
    "المراحل التعليميمة",
    "المجموعات",
    "الطلاب",
    "الحضور",
    "الدفع",
  ];
  List<Widget> pages= [
    EducationalStagesView(),
    GroubView(),
    StudentsView(),
    AttendanceView(),
    PaymentView(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarAppState());
  }
  void changePageMainView(int index) {
    currentIndex = index;
    emit(ChangePageMainViewAppState());
  }
}
