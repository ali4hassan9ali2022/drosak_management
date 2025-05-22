import 'package:drosak_management/Core/Helper/app_helper_groub.dart';

class GroubDetailsModel {
  final int id;
  final String name;
  final String note;
  final int educationalStageId;

  GroubDetailsModel({
    required this.id,
    required this.name,
    required this.note,
    required this.educationalStageId,
  });
  Map<String, Object> toJson() {
    return {
      AppHelperGroub.groudName: name,
      AppHelperGroub.groudNote: note,
      AppHelperGroub.groudIdToEducational: educationalStageId,
    };
  }

  factory GroubDetailsModel.fromJson(json) {
    return GroubDetailsModel(
      id: int.parse(json[AppHelperGroub.groudId].toString()),
      name: json[AppHelperGroub.groudName].toString(),
      note: json[AppHelperGroub.groudNote].toString(),
      educationalStageId: int.parse(json[AppHelperGroub.groudIdToEducational].toString()),
    );
  }
}
