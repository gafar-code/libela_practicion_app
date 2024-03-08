import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/schedule/domain/entities/appointment.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/set_reminder_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../presentation/utils/model/appointment_params.dart';
import '../entities/detail_appointment.dart';
import '../entities/set_reminder.dart';

abstract class ScheduleRepositories {
  Future<Either<RemoteFailure, List<AppointmentEntity>>> getAppointments(
      AppointmentParams params);
  Future<Either<RemoteFailure, SetReminderEntity>> setReminder(
      {required SetReminderBody body, required String appointmentCode});
  Future<Either<RemoteFailure, DetailAppointmentEntity>> getDetailAppointments(
      {required String appointmentCode});
}
