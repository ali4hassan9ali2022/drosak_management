import 'dart:io';

import 'package:drosak_management/Core/Database/Models/educational_stages_operation.dart';
import 'package:drosak_management/Core/Helper/app_helper_groub.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:drosak_management/Featured/Layout/Models/time_day_groub_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitialDataBaseState());
  TextEditingController nameEdController = TextEditingController();
  TextEditingController descEdController = TextEditingController();
  XFile? profilePic;
  ItemStageModel? itemStageModel;
  EducationalStagesOperation educationalStagesOperation =
      EducationalStagesOperation();
  GlobalKey<FormState> keyState = GlobalKey();
  //! Add Educational
  void addNewEducatonal() async {
    emit(LoadingAddEducational());
    try {
      bool inseret = await educationalStagesOperation.insertEducationalStages(
        ItemStageModel(
          id: 0,
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

  //! Get Educatioanl Data
  List<ItemStageModel> getData = [];
  void getAllEducationalData() async {
    emit(LoadingGetDataEducational());
    try {
      getData = await educationalStagesOperation.getAllEducationalData();
      print("Data is $getData");
      print("Data is ${getData.length}");
      emit(SuccsesGetDataEducational(itemStageModel: getData));
    } catch (e) {
      emit(FailureGetDateEducational(errMessage: "Error"));
    }
  }

  //! Search
  List<ItemStageModel> searchData = [];
  void searchAllEducationalData({required String searchWord}) async {
    emit(LoadingSearchDataEducational());
    try {
      searchData = await educationalStagesOperation.getSearchEducationalData(
        searchWord: searchWord,
      );
      print("Data is $searchData");
      emit(SuccsesSearchDataEducational(itemStageModel: searchData));
    } catch (e) {
      emit(FailureSearchDateEducational(errMessage: "Error"));
    }
  }

  //! Delete Data
  void deleteDstaEducationalStages({required int id}) async {
    try {
      bool delete = await educationalStagesOperation.deleteEducatinalStageData(
        id: id,
      );
      print("Delete: $delete");
      emit(SuccessDeleteDataEducationalStaeg());
      // getData.removeWhere((element) => element.id == id);
      getAllEducationalData();
    } catch (e) {
      emit(FailureDeleteDataEducationalStaeg(errMessage: "Error"));
    }
  }

  //! updata New Educatonal
  void updataNewEducatonal({required ItemStageModel items}) async {
    try {
      bool update = await educationalStagesOperation
          .updataEducationalStagesData(model: items);
      print("Update $update");
      emit(SuccessUpdataDataEducationalStaeg());
      getAllEducationalData();
    } catch (e) {
      emit(FailureUpdateDataEducationalStaeg(errMessage: "Error"));
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

  void initAllData() {
    getAllEducationalData();
  }

  TimeOfDay? time;
  void selectOfTime({required TimeOfDay selectTime}) {
    time = selectTime;
    emit(SelectTimeDatabaseState());
  }

  String? day;
  void selectOfDay({required String selectDay}) {
    day = selectDay;
    emit(SelectDayDatabaseState());
  }

  String? value;
  void selectOfMS({required String selectValue}) {
    value = selectValue;
    emit(SelectMSDatabaseState());
  }

  void addToTable({required String groubValueMS}) {
    AppHelperGroub.items.add(
      TimeDayGroubModel(
        day: day!,
        time: "${time!.hour} : ${time!.minute}",
        ms: groubValueMS,
      ),
    );
    emit(AddToTableDatabaseState());
  }

  void deletefromTable({required int index}) {
    AppHelperGroub.items.remove(AppHelperGroub.items[index]);
    emit(DeleteFromTableDatabaseState());
  }
}
