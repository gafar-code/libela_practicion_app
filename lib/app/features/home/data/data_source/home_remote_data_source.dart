import '../../presentation/utils/models/pending_appointment_params.dart';
import '../models/pending_appointment.dart';

abstract class HomeRemoteDataSource {
  Future<List<PendingAppointmentModel>> getPendingAppointment(
      PendingAppointmentParams param);
}
