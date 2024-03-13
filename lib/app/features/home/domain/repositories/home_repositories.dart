import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/core/error/error_imports.dart';
import 'package:libela_practition/app/features/home/domain/entities/pending_appointment.dart';

import '../../presentation/utils/models/pending_appointment_params.dart';

abstract class HomeRepositories {
  Future<Either<RemoteFailure, List<PendingAppointmentEntity>>>
      getPendingAppointment(PendingAppointmentParams param);
}
