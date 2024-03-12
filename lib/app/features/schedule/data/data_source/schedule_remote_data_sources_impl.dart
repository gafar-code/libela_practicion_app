import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import '../../presentation/utils/model/appointment_params.dart';
import '../../presentation/utils/model/set_reminder_body.dart';
import '../models/appointment.dart';
import '../models/detail_appointment.dart';
import '../models/set_reminder.dart';
import 'schedule_remote_data_sources.dart';

class ScheduleRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements ScheduleRemoteDataSource {
  ScheduleRemoteDataSourcesImpl(super.client);

  @override
  Future<List<AppointmentModel>> getAppointments(
      AppointmentParams params) async {
    final response = await hitAPI(() => get(Endpoints.appointments, params));
    return List.from(response['data'])
        .map((e) => AppointmentModel.fromJson(e))
        .toList();
  }

  @override
  Future<SetReminderModel> setReminder(
      {required SetReminderBody body, required String appointmentCode}) async {
    final response = await hitAPI(() => patch(
        Endpoints.appointments + '/${appointmentCode}/set-reminder',
        body: body));
    return SetReminderModel.fromJson(response['data']);
  }

  @override
  Future<DetailAppointmentModel> getDetailAppointments(
      {required String appointmentCode}) async {
    final response =
        await hitAPI(() => get(Endpoints.appointments + '/$appointmentCode'));
    return DetailAppointmentModel.fromJson(response['data']);
  }

  @override
  Future<dynamic> confirmAppointment(String appointmentCode) async {
    final response = await hitAPI(
        () => patch(Endpoints.appointments + '/$appointmentCode/confirm'));
    return response['data'];
  }

  @override
  Future<dynamic> acceptAppointment(String appointmentCode) async {
    final response = await hitAPI(
        () => patch(Endpoints.appointments + '/$appointmentCode/accept'));
    return response['data'];
  }

  @override
  Future<dynamic> rejectAppointment(String appointmentCode) async {
    final response = await hitAPI(
        () => patch(Endpoints.appointments + '/$appointmentCode/reject'));
    return response['data'];
  }

  @override
  Future<dynamic> startSessionAppointment(String appointmentCode) async {
    final response = await hitAPI(
        () => patch(Endpoints.appointments + '/$appointmentCode/start'));
    return response['data'];
  }
}
