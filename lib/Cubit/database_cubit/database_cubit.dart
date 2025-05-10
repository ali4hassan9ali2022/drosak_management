import 'dart:io';

import 'package:drosak_management/Core/Database/Models/educational_stages_operation.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitialDataBaseState());
  TextEditingController nameEdController = TextEditingController();
  TextEditingController descEdController = TextEditingController();
  XFile? profilePic;
  GlobalKey<FormState> keyState = GlobalKey();
  void addNewEducatonal() async {
    emit(LoadingAddEducational());
    try {
      EducationalStagesOperation educationalStagesOperation =
          EducationalStagesOperation();
      bool inseret = await educationalStagesOperation.insertEducationalStages(
        ItemStageModel(
          id: 1,
          name: nameEdController.text,
          desc: descEdController.text,
          image: profilePic?.path ?? "",
        ),
      );
      print(inseret);
      nameEdController.clear();
      descEdController.clear();
      profilePic = null;
      emit(SuccsesAddEducational());
      getAllEducationalData();
    } catch (e) {
      emit(FailureAddEducational(errMessage: "Error"));
    }
  }

  List<ItemStageModel> getData = [];
  void getAllEducationalData() async {
    emit(LoadingGetDataEducational());
    try {
      EducationalStagesOperation educationalStagesOperation =
          EducationalStagesOperation();
      getData = await educationalStagesOperation.getAllEducationalData();
      print("Data is $getData");
      emit(SuccsesGetDataEducational(itemStageModel: getData));
    } catch (e) {
      emit(FailureGetDateEducational(errMessage: "Error"));
    }
  }

  List<ItemStageModel> searchData = [];
  void searchAllEducationalData({required String searchWord}) async {
    emit(LoadingSearchDataEducational());
    try {
      EducationalStagesOperation educationalStagesOperation =
          EducationalStagesOperation();
      searchData = await educationalStagesOperation.getSearchEducationalData(
        searchWord: searchWord,
      );
      print("Data is $searchData");
      emit(SuccsesSearchDataEducational(itemStageModel: searchData));
    } catch (e) {
      emit(FailureSearchDateEducational(errMessage: "Error"));
    }
  }

  uploadProfilePic(File image) {
    profilePic = XFile(image.path);
    emit(UploadProfilePic());
  }

  removeProfilePic() {
    profilePic = null;
    emit(RemoveProfilePic());
  }
}
