import 'package:libela_practition/app/features/home/data/models/pending_appointment.dart';

import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import '../../presentation/utils/models/pending_appointment_params.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements HomeRemoteDataSource {
  HomeRemoteDataSourcesImpl(super.client);

  @override
  Future<List<PendingAppointmentModel>> getPendingAppointment(
      PendingAppointmentParams param) async {
    final response =
        await hitAPI(() => get(Endpoints.appointmentsPending, param));
    return List.from(response['data'])
        .map((e) => PendingAppointmentModel.fromJson(e))
        .toList();
  }
}
