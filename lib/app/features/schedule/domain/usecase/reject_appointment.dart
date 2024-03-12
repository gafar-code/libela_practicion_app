import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/schedule/domain/repositories/schedule_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class RejectAppointment extends UseCase<dynamic, String> {
  final ScheduleRepositories _scheduleRepositories;

  RejectAppointment(this._scheduleRepositories);

  @override
  Future<Either<RemoteFailure, dynamic>> call(String appointmentCode) async {
    return _scheduleRepositories.rejectAppointment(appointmentCode);
  }
}
