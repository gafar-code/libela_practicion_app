class SetReminderModel {
  String? appointmentCode;
  int? activateReminder;

  SetReminderModel({this.appointmentCode, this.activateReminder});

  SetReminderModel.fromJson(Map<String, dynamic> json) {
    appointmentCode = json['appointmentCode'];
    activateReminder = json['activateReminder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentCode'] = this.appointmentCode;
    data['activateReminder'] = this.activateReminder;
    return data;
  }
}
