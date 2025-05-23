import 'dart:developer';
import 'dart:io';

import 'package:drosak_management/Core/Database/Models/educational_stages_operation.dart';
import 'package:drosak_management/Core/Database/Models/groub_operation.dart';
import 'package:drosak_management/Core/Helper/app_helper_groub.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Models/appointment_model.dart';
import 'package:drosak_management/Featured/Layout/Models/groub_details_model.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitialDataBaseState());
  TextEditingController nameEdController = TextEditingController();
  TextEditingController descEdController = TextEditingController();
  TextEditingController groubNameEdController = TextEditingController();
  TextEditingController groubDecEdController = TextEditingController();
  XFile? profilePic;
  ItemStageModel? itemStageModelEducatioanlStage;
  EducationalStagesOperation educationalStagesOperation =
      EducationalStagesOperation();
  GroubOperation groubOperation = GroubOperation();
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
      log("inseret: $inseret");
      nameEdController.clear();
      descEdController.clear();
      profilePic = null;
      emit(SuccsesAddEducational());
      getAllEducationalData();
    } catch (e) {
      emit(FailureAddEducational(errMessage: "Error"));
    }
  }

  //! Add Groub
  Future<bool> addGroub() async {
    emit(LoadingAddGroup());
    try {
      bool inseret = await groubOperation.insertGroub(
        GroubDetailsModel(
          id: 0,
          name: groubNameEdController.text,
          note: groubDecEdController.text,
          educationalStageId: itemStageModelEducatioanlStage!.id,
        ),
      );
      log("inseret: $inseret");
      if (!inseret) {
        emit(FailureAddGroup(errMessage: "Error"));
        return false;
      }
      groubNameEdController.clear();
      groubDecEdController.clear();
      emit(SuccsesAddGroup());
      getAllGruopData();
      return true;
    } catch (e) {
      emit(FailureAddGroup(errMessage: e.toString()));
    }
    return false;
  }

  //! Add Appointment
  Future<bool> addAppointment() async {
    emit(LoadingAddAppointment());
    try {
      for (var appointment in AppHelperGroub.items) {
        GroubOperation groubOperation = GroubOperation();
        bool inseret = await groubOperation.insertApponint(appointment);
        log("inseret: $inseret");
        if (!inseret) {
          emit(FailureAddAppointment(errMessage: "Error"));
          return false;
        }
        emit(SuccsesAddAppointment());
        return true;
      }
    } catch (e) {
      emit(FailureAddAppointment(errMessage: e.toString()));
    }
    return false;
  }

  //! Get Educatioanl Data
  List<ItemStageModel> getData = [];
  void getAllEducationalData() async {
    emit(LoadingGetDataEducational());
    try {
      getData = await educationalStagesOperation.getAllEducationalData();
      log("Educational Data is $getData");
      log("Educational Data is ${getData.length}");
      emit(SuccsesGetDataEducational(itemStageModel: getData));
    } catch (e) {
      emit(FailureGetDateEducational(errMessage: "Error"));
    }
  }

  //! Get Group Data
  List<GroubDetailsModel> getGroupData = [];
  void getAllGruopData() async {
    emit(LoadingGetDataGroup());
    try {
      getGroupData = await groubOperation.getAllGroupData();
      log("Group Data is $getGroupData");
      log("Group Data is ${getGroupData.length}");
      emit(SuccsesGetDataGroup(itemGroupModel: getGroupData));
    } catch (e) {
      emit(FailureGetDateGroup(errMessage: "Error"));
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
      log("Data is $searchData");
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
      log("Delete: $delete");
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
      log("$update");
      emit(SuccessUpdataDataEducationalStaeg());
      getAllEducationalData();
    } catch (e) {
      emit(FailureUpdateDataEducationalStaeg(errMessage: "Error"));
    }
  }

  //! Upload ProfilePic
  uploadProfilePic(File image) {
    profilePic = XFile(image.path);
    emit(UploadProfilePic());
  }

  //! Remove ProfilePic
  removeProfilePic() {
    profilePic = null;
    emit(RemoveProfilePic());
  }

  //! Select of Time
  TimeOfDay? time;
  void selectOfTime({required TimeOfDay selectTime}) {
    time = selectTime;
    emit(SelectTimeDatabaseState());
  }

  //! Select of Day
  String? day;
  void selectOfDay({required String selectDay}) {
    day = selectDay;
    emit(SelectDayDatabaseState());
  }

  //! Select of M Or S
  String? value;
  void selectOfMS({required String selectValue}) {
    value = selectValue;
    emit(SelectMSDatabaseState());
  }

  //! Add To Table Appointment
  void addToTableAppointment({required String groubValueMS}) {
    AppHelperGroub.items.add(
      AppointmentModel(
        day: day!,
        time: "${time!.hour} : ${time!.minute}",
        ms: groubValueMS,
      ),
    );
    emit(AddToTableDatabaseState());
  }

  //! Delete from Table Appointment
  void deletefromTableAppointment({required int index}) {
    AppHelperGroub.items.remove(AppHelperGroub.items[index]);
    emit(DeleteFromTableDatabaseState());
  }
}
