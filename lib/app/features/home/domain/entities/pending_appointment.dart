import 'package:equatable/equatable.dart';

import '../../data/models/pending_appointment.dart';

class PendingAppointmentEntity extends Equatable {
  final String? id;
  final String? appointmentCode;
  final String? apStatus;
  final String? orderCode;
  final String? apStartAt;

  PendingAppointmentEntity(
      {this.id,
      this.appointmentCode,
      this.apStatus,
      this.orderCode,
      this.apStartAt});
  factory PendingAppointmentEntity.fromModel(PendingAppointmentModel model) {
    return PendingAppointmentEntity(
        id: model.id,
        appointmentCode: model.appointmentCode,
        apStatus: model.apStatus,
        orderCode: model.orderCode,
        apStartAt: model.apStartAt);
  }

  @override
  List<Object?> get props =>
      [id, appointmentCode, apStatus, orderCode, apStartAt];
}
