class AppointmentModel {
  String? id;
  String? appointmentCode;
  int? isConfirm;
  int? setReminder;
  String? startAt;
  String? endAt;
  String? status;
  PatientModel? patient;

  AppointmentModel(
      {this.id,
      this.appointmentCode,
      this.isConfirm,
      this.setReminder,
      this.startAt,
      this.endAt,
      this.status,
      this.patient});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentCode = json['appointmentCode'];
    isConfirm = json['isConfirm'];
    setReminder = json['setReminder'];
    startAt = json['startAt'];
    endAt = json['endAt'];
    status = json['status'];
    patient = json['patient'] != null
        ? new PatientModel.fromJson(json['patient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointmentCode'] = this.appointmentCode;
    data['isConfirm'] = this.isConfirm;
    data['setReminder'] = this.setReminder;
    data['startAt'] = this.startAt;
    data['endAt'] = this.endAt;
    data['status'] = this.status;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    return data;
  }
}

class PatientModel {
  String? name;
  String? address;
  String? avatar;

  PatientModel({this.name, this.address, this.avatar});

  PatientModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
    return data;
  }
}
