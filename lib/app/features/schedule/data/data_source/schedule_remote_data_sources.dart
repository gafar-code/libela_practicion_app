import 'package:libela_practition/app/features/schedule/data/models/set_reminder.dart';

import '../../presentation/utils/model/appointment_params.dart';
import '../../presentation/utils/model/set_reminder_body.dart';
import '../models/appointment.dart';
import '../models/detail_appointment.dart';

abstract class ScheduleRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments(AppointmentParams params);
  Future<SetReminderModel> setReminder(
      {required SetReminderBody body, required String appointmentCode});
  Future<DetailAppointmentModel> getDetailAppointments(
      {required String appointmentCode});
  Future<dynamic> confirmAppointment(String appointmentCode);
  Future<dynamic> acceptAppointment(String appointmentCode);
  Future<dynamic> rejectAppointment(String appointmentCode);
  Future<dynamic> startSessionAppointment(String appointmentCode);
}
