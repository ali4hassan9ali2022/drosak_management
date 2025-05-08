import 'package:drosak_management/Core/Database/Local/sq_flite_database.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitialDataBaseState());
  TextEditingController nameEdController = TextEditingController();
  TextEditingController descEdController = TextEditingController();

  void addNewEducatonal() async {
    EducationalStagesOperation educationalStagesOperation =
        EducationalStagesOperation();
    bool inseret = await educationalStagesOperation.insertEducationalStages(
      ItemStageModel(
        id: 1,
        name: nameEdController.text,
        desc: descEdController.text,
        image: Assets.imagesPlaceholderSvg,
      ),
    );
    print(inseret);
  }
  void getAllEducationalData() async{
     EducationalStagesOperation educationalStagesOperation =
        EducationalStagesOperation();
      List<Map<String, Object?>> getData = await educationalStagesOperation.getAllEducationalData();
      print(getData);
  }
}
