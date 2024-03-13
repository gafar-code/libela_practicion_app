import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/home/domain/entities/pending_appointment.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/models/pending_appointment_params.dart';
import '../repositories/home_repositories.dart';

class GetPendingAppointments
    extends UseCase<List<PendingAppointmentEntity>, PendingAppointmentParams> {
  final HomeRepositories _homeRepositories;

  GetPendingAppointments(this._homeRepositories);

  @override
  Future<Either<RemoteFailure, List<PendingAppointmentEntity>>> call(
      PendingAppointmentParams param) async {
    return _homeRepositories.getPendingAppointment(param);
  }
}
