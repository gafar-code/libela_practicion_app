import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/schedule/domain/entities/appointment.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/entities/detail_appointment.dart';
import '../../domain/entities/set_reminder.dart';
import '../../domain/repositories/schedule_repositories.dart';
import '../../presentation/utils/model/appointment_params.dart';
import '../../presentation/utils/model/set_reminder_body.dart';
import '../data_source/schedule_remote_data_sources.dart';

class ScheduleRepositoriesImpl implements ScheduleRepositories {
  final ScheduleRemoteDataSource _scheduleRemoteDataSource;
  ScheduleRepositoriesImpl(this._scheduleRemoteDataSource);

  @override
  Future<Either<RemoteFailure, List<AppointmentEntity>>> getAppointments(
      AppointmentParams params) async {
    try {
      final data = await _scheduleRemoteDataSource.getAppointments(params);
      final appointments =
          data.map((e) => AppointmentEntity.fromModel(e)).toList();
      return Right(appointments);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, SetReminderEntity>> setReminder(
      {required SetReminderBody body, required String appointmentCode}) async {
    try {
      final data = await _scheduleRemoteDataSource.setReminder(
          body: body, appointmentCode: appointmentCode);
      return Right(SetReminderEntity.fromModel(data));
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, DetailAppointmentEntity>> getDetailAppointments(
      {required String appointmentCode}) async {
    try {
      final data = await _scheduleRemoteDataSource.getDetailAppointments(
          appointmentCode: appointmentCode);
      return Right(DetailAppointmentEntity.fromModel(data));
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, dynamic>> confirmAppointment(
      String appointmentCode) async {
    try {
      final data =
          await _scheduleRemoteDataSource.confirmAppointment(appointmentCode);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, dynamic>> acceptAppointment(
      String appointmentCode) async {
    try {
      final data =
          await _scheduleRemoteDataSource.acceptAppointment(appointmentCode);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, dynamic>> rejectAppointment(
      String appointmentCode) async {
    try {
      final data =
          await _scheduleRemoteDataSource.rejectAppointment(appointmentCode);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, dynamic>> startSessionAppointment(
      String appointmentCode) async {
    try {
      final data = await _scheduleRemoteDataSource
          .startSessionAppointment(appointmentCode);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}
