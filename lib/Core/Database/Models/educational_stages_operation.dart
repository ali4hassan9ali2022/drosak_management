import 'package:drosak_management/Core/Database/Local/sq_flite_database.dart';
import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';

class EducationalStagesOperation extends SqFliteDatabase {
  Future<bool> insertEducationalStages(ItemStageModel model) async {
    return await inseretData(
      tableName: AppHelper.educationalStagesTableName,
      values: model.toJson(),
    );
  }

  Future<List<ItemStageModel>> getAllEducationalData() async {
    List<ItemStageModel> items = [];
    List<Map<String, Object?>> data = await getData(
      tableName: AppHelper.educationalStagesTableName,
    );
    for (var item in data) {
      items.add(ItemStageModel.fromJson(item));
    }
    return items;
  }

  Future<List<ItemStageModel>> getSearchEducationalData({
    required String searchWord,
  }) async {
    List<ItemStageModel> items = [];
    List<Map<String, Object?>> data = await searchData(
      tableName: AppHelper.educationalStagesTableName,
      where: "${AppHelper.educationalStagesName} LIKE ? ",
      whereArgs: ["%$searchWord%"],
    );
    for (var item in data) {
      items.add(ItemStageModel.fromJson(item));
    }
    return items;
  }

  Future<bool> deleteEducatinalStageData({required int id}) async {
    return await deleteData(
      tableName: AppHelper.educationalStagesTableName,
      where: "${AppHelper.educationalStagesId} = ?",
      whereArgs: ["$id"],
    );
  }

  Future<bool> updataEducationalStagesData({
    required ItemStageModel model,
  }) async {
    return await ubdateData(
      tableName: AppHelper.educationalStagesTableName,
      values: model.toJson(),
      where: "${AppHelper.educationalStagesId} = ?",
      whereArgs: [model.id],
    );
  }
}
