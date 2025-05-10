import 'package:drosak_management/Core/Helper/app_helper.dart';

class ItemStageModel {
  final int? id;
  final String name;
  final String desc;
  final String image;
 DateTime? createI;
  ItemStageModel( {
    this.createI,
    this.id,
    required this.name,
    required this.desc,
    required this.image,
  });
  Map<String, Object> toJson() {
    return {
      AppHelper.educationalStagesName: name,
      AppHelper.educationalStagesDes: desc,
      AppHelper.educationalStagesImage: image,
    };
  }

  factory ItemStageModel.fromJson(json) {
    return ItemStageModel(
      createI:DateTime.parse( json[AppHelper.educationalStagesCreateAt].toString()),
      id: int.parse(json[AppHelper.educationalStagesId].toString()),
      name: json[AppHelper.educationalStagesName].toString(),
      desc: json[AppHelper.educationalStagesDes].toString(),
      image: json[AppHelper.educationalStagesImage].toString(),
    );
  }
}
