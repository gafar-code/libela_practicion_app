class PendingAppointmentModel {
  String? id;
  String? appointmentCode;
  String? apStatus;
  String? orderCode;
  String? apStartAt;

  PendingAppointmentModel(
      {this.id,
      this.appointmentCode,
      this.apStatus,
      this.orderCode,
      this.apStartAt});

  PendingAppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentCode = json['appointmentCode'];
    apStatus = json['apStatus'];
    orderCode = json['orderCode'];
    apStartAt = json['apStartAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointmentCode'] = this.appointmentCode;
    data['apStatus'] = this.apStatus;
    data['orderCode'] = this.orderCode;
    data['apStartAt'] = this.apStartAt;
    return data;
  }
}
