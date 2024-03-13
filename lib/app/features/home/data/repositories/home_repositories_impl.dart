import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/home/domain/entities/pending_appointment.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/repositories/home_repositories.dart';
import '../../presentation/utils/models/pending_appointment_params.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepositoriesImpl(this._homeRemoteDataSource);

  @override
  Future<Either<RemoteFailure, List<PendingAppointmentEntity>>>
      getPendingAppointment(PendingAppointmentParams param) async {
    try {
      final data = await _homeRemoteDataSource.getPendingAppointment(param);
      final appointments =
          data.map((e) => PendingAppointmentEntity.fromModel(e)).toList();
      return Right(appointments);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}
