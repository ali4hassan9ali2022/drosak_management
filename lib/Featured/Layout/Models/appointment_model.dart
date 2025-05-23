import 'package:drosak_management/Core/Helper/app_helper_groub.dart';

class AppointmentModel {
  String day;
  String time;
  String ms;
  int groubId;
  int id;
  AppointmentModel({
    required this.day,
    required this.time,
    required this.ms,
    this.groubId = 0,
    this.id = 0,
  });
  Map<String, Object> toJson() {
    return {
      AppHelperGroub.appointmentId: id,
      AppHelperGroub.appointmentIdToGroub: groubId,
      AppHelperGroub.appointmentDay: day,
      AppHelperGroub.appointmentHour: time,
      AppHelperGroub.appointmentTime: ms,
    };
  }

  factory AppointmentModel.fromJson(json) {
    return AppointmentModel(
      day: json[AppHelperGroub.appointmentDay],
      time: json[AppHelperGroub.appointmentHour],
      ms: json[AppHelperGroub.appointmentTime],
    );
  }
}
