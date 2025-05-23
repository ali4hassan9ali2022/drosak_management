import 'package:drosak_management/Core/Database/Local/sq_flite_database.dart';
import 'package:drosak_management/Core/Helper/app_helper_groub.dart';
import 'package:drosak_management/Featured/Layout/Models/appointment_model.dart';
import 'package:drosak_management/Featured/Layout/Models/groub_details_model.dart';

class GroubOperation extends SqFliteDatabase {
  Future<bool> insertGroub(GroubDetailsModel model) async {
    return await inseretData(
      tableName: AppHelperGroub.groudTableName,
      values: model.toJson(),
    );
  }
  Future<bool> insertApponint(AppointmentModel model) async {
    return await inseretData(
      tableName: AppHelperGroub.appointmentTableName,
      values: model.toJson(),
    );
  }
  Future<List<GroubDetailsModel>> getAllGroupData() async {
    List<GroubDetailsModel> items = [];
    List<Map<String, Object?>> data = await getData(
      tableName: AppHelperGroub.groudTableName,
    );
    for (var item in data) {
      items.add(GroubDetailsModel.fromJson(item));
    }
    return items;
  }
}
