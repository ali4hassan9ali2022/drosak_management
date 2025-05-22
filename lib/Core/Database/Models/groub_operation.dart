import 'package:drosak_management/Core/Database/Local/sq_flite_database.dart';
import 'package:drosak_management/Core/Helper/app_helper_groub.dart';
import 'package:drosak_management/Featured/Layout/Models/groub_details_model.dart';

class GroubOperation extends SqFliteDatabase {
  Future<bool> insertGroub(GroubDetailsModel model) async {
    return await inseretData(
      tableName: AppHelperGroub.groudTableName,
      values: model.toJson(),
    );
  }
}
