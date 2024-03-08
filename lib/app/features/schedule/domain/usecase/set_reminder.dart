import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/schedule/domain/entities/set_reminder.dart';
import 'package:libela_practition/app/features/schedule/domain/repositories/schedule_repositories.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/set_reminder_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class SetReminder
    extends UseCaseWithParamBody<SetReminderEntity, String, SetReminderBody> {
  final ScheduleRepositories _scheduleRepositories;

  SetReminder(this._scheduleRepositories);

  @override
  Future<Either<RemoteFailure, SetReminderEntity>> call(
      String appointmentCode, SetReminderBody body) async {
    return _scheduleRepositories.setReminder(
        body: body, appointmentCode: appointmentCode);
  }
}
