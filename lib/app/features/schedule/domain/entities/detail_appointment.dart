import 'package:equatable/equatable.dart';

import '../../data/models/detail_appointment.dart';

class DetailAppointmentEntity extends Equatable {
  final String? startAt;
  final String? endAt;
  final String? status;
  final CustomerDetailEntity? customer;
  final PatientDetailEntity? patient;
  final ServiceEntity? service;
  final PatientTreatmentsEntity? patientTreatments;

  DetailAppointmentEntity(
      {this.startAt,
      this.endAt,
      this.status,
      this.customer,
      this.patient,
      this.service,
      this.patientTreatments});

  factory DetailAppointmentEntity.fromModel(DetailAppointmentModel model) {
    return DetailAppointmentEntity(
        startAt: model.startAt,
        endAt: model.endAt,
        status: model.status,
        customer: model.customer != null
            ? CustomerDetailEntity.fromModel(model.customer!)
            : null,
        patient: model.patient != null
            ? PatientDetailEntity.fromModel(model.patient!)
            : null,
        service: model.service != null
            ? ServiceEntity.fromModel(model.service!)
            : null,
        patientTreatments: model.patientTreatments != null
            ? PatientTreatmentsEntity.fromModel(model.patientTreatments!)
            : null);
  }

  DetailAppointmentEntity copyWith(
      {String? startAt,
      String? endAt,
      String? status,
      CustomerDetailEntity? customer,
      PatientDetailEntity? patient,
      ServiceEntity? service,
      PatientTreatmentsEntity? patientTreatments}) {
    return DetailAppointmentEntity(
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
        status: status ?? this.status,
        customer: customer ?? this.customer,
        patient: patient ?? this.patient,
        service: service ?? this.service,
        patientTreatments: patientTreatments ?? this.patientTreatments);
  }

  @override
  List<Object?> get props =>
      [startAt, endAt, status, customer, patient, service, patientTreatments];
}

class CustomerDetailEntity extends Equatable {
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final String? gender;
  final String? nik;

  CustomerDetailEntity(
      {this.name, this.address, this.phone, this.email, this.gender, this.nik});

  factory CustomerDetailEntity.fromModel(CustomerDetailModel model) {
    return CustomerDetailEntity(
        name: model.name,
        address: model.address,
        phone: model.phone,
        email: model.email,
        gender: model.gender,
        nik: model.nik);
  }

  @override
  List<Object?> get props => [name, address, phone, email, gender, nik];
}

class PatientDetailEntity extends Equatable {
  final String? name;
  final String? address;
  final String? phone;
  final String? birthdate;
  final String? symptoms;
  final String? gender;
  final String? nik;
  final String? avatar;

  PatientDetailEntity(
      {this.name,
      this.address,
      this.phone,
      this.birthdate,
      this.symptoms,
      this.gender,
      this.nik,
      this.avatar});

  factory PatientDetailEntity.fromModel(PatientDetailModel model) {
    return PatientDetailEntity(
        name: model.name,
        address: model.address,
        phone: model.phone,
        birthdate: model.birthdate,
        symptoms: model.symptoms,
        gender: model.gender,
        nik: model.nik,
        avatar: model.avatar);
  }

  @override
  List<Object?> get props =>
      [name, address, phone, birthdate, symptoms, gender, nik, avatar];
}

class ServiceEntity extends Equatable {
  final String? productName;
  final String? productDesc;

  ServiceEntity({this.productName, this.productDesc});

  factory ServiceEntity.fromModel(ServiceModel model) {
    return ServiceEntity(
        productName: model.productName, productDesc: model.productDesc);
  }

  @override
  List<Object?> get props => [productName, productDesc];
}

class PatientTreatmentsEntity extends Equatable {
  final int? functionalAbility;
  final int? standingAbility;
  final int? liftingAbility;
  final int? dailyActivity;
  final String? treatments;
  final String? treatmentPlans;
  final String? notes;

  PatientTreatmentsEntity(
      {this.functionalAbility,
      this.standingAbility,
      this.liftingAbility,
      this.dailyActivity,
      this.treatments,
      this.treatmentPlans,
      this.notes});

  factory PatientTreatmentsEntity.fromModel(PatientTreatmentsModel model) {
    return PatientTreatmentsEntity(
        functionalAbility: model.functionalAbility,
        standingAbility: model.standingAbility,
        liftingAbility: model.liftingAbility,
        dailyActivity: model.dailyActivity,
        treatments: model.treatments,
        treatmentPlans: model.treatmentPlans,
        notes: model.notes);
  }

  @override
  List<Object?> get props => [
        functionalAbility,
        standingAbility,
        liftingAbility,
        dailyActivity,
        treatments,
        treatmentPlans,
        notes
      ];
}
