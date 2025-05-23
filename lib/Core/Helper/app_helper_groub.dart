import 'package:drosak_management/Featured/Layout/Models/appointment_model.dart';

abstract class AppHelperGroub {
  //! Groub Table
  static const String groudTableName = "groudTableName";
  static const String groudId = "groudId";
  static const String groudName = "groudName";
  static const String groudNote = "groudNote";
  static const String groudIdToEducational = "groudIdToEducational";
  //! Appointment Table
  static const String appointmentTableName = "appointmentTableName";
  static const String appointmentId = "appointmentId";
  static const String appointmentDay = "appointmentDay";
  static const String appointmentHour = "appointmentHour";
  static const String appointmentTime = "appointmentTime";
  static const String appointmentIdToGroub = "appointmentIdToGroub";
  static List<AppointmentModel> items = [];
}
