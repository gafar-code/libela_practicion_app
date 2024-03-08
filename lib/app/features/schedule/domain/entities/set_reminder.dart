import 'package:equatable/equatable.dart';

import '../../data/models/set_reminder.dart';

class SetReminderEntity extends Equatable {
  final String? appointmentCode;
  final int? activateReminder;

  SetReminderEntity({this.appointmentCode, this.activateReminder});

  factory SetReminderEntity.fromModel(SetReminderModel model) {
    return SetReminderEntity(
        appointmentCode: model.appointmentCode,
        activateReminder: model.activateReminder);
  }

  @override
  List<Object?> get props => [appointmentCode, activateReminder];
}
