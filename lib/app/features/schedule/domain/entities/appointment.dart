import 'package:equatable/equatable.dart';

import '../../data/models/appointment.dart';

class AppointmentEntity extends Equatable {
  final String? id;
  final String? appointmentCode;
  final int? isConfirm;
  final int? setReminder;
  final String? startAt;
  final String? endAt;
  final String? status;
  final PatientEntity? patient;

  AppointmentEntity(
      {this.id,
      this.appointmentCode,
      this.isConfirm,
      this.setReminder,
      this.startAt,
      this.endAt,
      this.status,
      this.patient});

  factory AppointmentEntity.fromModel(AppointmentModel model) {
    return AppointmentEntity(
        id: model.id,
        appointmentCode: model.appointmentCode,
        isConfirm: model.isConfirm,
        setReminder: model.setReminder,
        startAt: model.startAt,
        endAt: model.endAt,
        status: model.status,
        patient: model.patient != null
            ? PatientEntity.fromModel(model.patient!)
            : null);
  }

  AppointmentEntity copyWith(
      {String? id,
      String? appointmentCode,
      int? isConfirm,
      int? setReminder,
      String? startAt,
      String? endAt,
      String? status,
      PatientEntity? patient}) {
    return AppointmentEntity(
        id: id ?? this.id,
        appointmentCode: appointmentCode ?? this.appointmentCode,
        isConfirm: isConfirm ?? this.isConfirm,
        setReminder: setReminder ?? this.setReminder,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
        status: status ?? this.status,
        patient: patient ?? this.patient);
  }

  @override
  List<Object?> get props => [
        id,
        appointmentCode,
        isConfirm,
        setReminder,
        startAt,
        endAt,
        status,
        patient
      ];
}

class PatientEntity extends Equatable {
  final String? name;
  final String? address;
  final String? avatar;

  PatientEntity({this.name, this.address, this.avatar});

  factory PatientEntity.fromModel(PatientModel model) {
    return PatientEntity(
        name: model.name, address: model.address, avatar: model.avatar);
  }

  @override
  List<Object?> get props => [name, address, avatar];
}
