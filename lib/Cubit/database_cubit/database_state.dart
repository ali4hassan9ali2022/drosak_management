import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';

abstract class DatabaseState {}

class InitialDataBaseState extends DatabaseState {}

class UploadProfilePic extends DatabaseState {}
class RemoveProfilePic extends DatabaseState {}
class LoadingAddEducational extends DatabaseState {}
class SuccsesAddEducational extends DatabaseState {}
class FailureAddEducational extends DatabaseState {
  final String errMessage;

  FailureAddEducational({required this.errMessage});

}
class LoadingGetDataEducational extends DatabaseState {}
class SuccsesGetDataEducational extends DatabaseState {
  final List<ItemStageModel> itemStageModel;

  SuccsesGetDataEducational({required this.itemStageModel});
}
class FailureGetDateEducational extends DatabaseState {
  final String errMessage;

  FailureGetDateEducational({required this.errMessage});

}
class LoadingSearchDataEducational extends DatabaseState {}
class SuccsesSearchDataEducational extends DatabaseState {
  final List<ItemStageModel> itemStageModel;

  SuccsesSearchDataEducational({required this.itemStageModel});
}
class FailureSearchDateEducational extends DatabaseState {
  final String errMessage;

  FailureSearchDateEducational({required this.errMessage});

}
class SuccessDeleteDataEducationalStaeg extends DatabaseState{}
class FailureDeleteDataEducationalStaeg extends DatabaseState{
  final String errMessage;

  FailureDeleteDataEducationalStaeg({required this.errMessage});
}
class SuccessUpdataDataEducationalStaeg extends DatabaseState{}
class FailureUpdateDataEducationalStaeg extends DatabaseState{
  final String errMessage;

  FailureUpdateDataEducationalStaeg({required this.errMessage});
}