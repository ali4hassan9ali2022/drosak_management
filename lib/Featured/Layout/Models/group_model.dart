import 'package:drosak_management/Featured/Layout/Models/appointment_model.dart';
import 'package:drosak_management/Featured/Layout/Models/groub_details_model.dart';

class GroupModel {
  GroubDetailsModel groubDetailsModel;
  List<AppointmentModel> listAppointment;
  GroupModel({required this.groubDetailsModel, required this.listAppointment});
}