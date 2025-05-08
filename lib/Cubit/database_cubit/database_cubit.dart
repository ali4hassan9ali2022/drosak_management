import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitialDataBaseState());
  TextEditingController nameEdController = TextEditingController();
  TextEditingController descEdController = TextEditingController();
}