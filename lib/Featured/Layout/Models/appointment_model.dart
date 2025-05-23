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
  Map<String, Object> toJson(int groupId) {
    return {
      AppHelperGroub.appointmentId: id,
      AppHelperGroub.appointmentIdToGroub: groupId,
      AppHelperGroub.appointmentDay: day,
      AppHelperGroub.appointmentHour: time,
      AppHelperGroub.appointmentTime: ms,
    };
  }

  factory AppointmentModel.fromJson(json) {
    return AppointmentModel(
      groubId: int.parse(json[AppHelperGroub.groudId].toString()),
      day: json[AppHelperGroub.appointmentDay],
      time: json[AppHelperGroub.appointmentHour],
      ms: json[AppHelperGroub.appointmentTime],
    );
  }
}
