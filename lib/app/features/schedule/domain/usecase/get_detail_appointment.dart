import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/schedule/domain/entities/detail_appointment.dart';
import 'package:libela_practition/app/features/schedule/domain/repositories/schedule_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetDetailAppointments extends UseCase<DetailAppointmentEntity, String> {
  final ScheduleRepositories _scheduleRepositories;

  GetDetailAppointments(this._scheduleRepositories);

  @override
  Future<Either<RemoteFailure, DetailAppointmentEntity>> call(
      String appointmentCode) async {
    return _scheduleRepositories.getDetailAppointments(
        appointmentCode: appointmentCode);
  }
}
