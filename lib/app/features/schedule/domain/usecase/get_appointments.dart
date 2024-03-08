import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/schedule/domain/entities/appointment.dart';
import 'package:libela_practition/app/features/schedule/domain/repositories/schedule_repositories.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/appointment_params.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetAppointments
    extends UseCase<List<AppointmentEntity>, AppointmentParams> {
  final ScheduleRepositories _scheduleRepositories;

  GetAppointments(this._scheduleRepositories);

  @override
  Future<Either<RemoteFailure, List<AppointmentEntity>>> call(
      AppointmentParams param) async {
    return _scheduleRepositories.getAppointments(param);
  }
}
