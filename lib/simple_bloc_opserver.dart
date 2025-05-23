import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocOpserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("Change = $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("Close = $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("Create = $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("onTransition Bloc = $bloc");
    debugPrint("onTransition = $transition");
    // TODO: implement onTransition
  }
}
