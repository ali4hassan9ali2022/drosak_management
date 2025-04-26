import 'package:drosak_management/Cubit/app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());
  int currentIndex= 0;
  PageController pageController = PageController();
  void changePageView(int index) {
    currentIndex = index;
    emit(ChangePageViewAppState());
  }
}