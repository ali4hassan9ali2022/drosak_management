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
