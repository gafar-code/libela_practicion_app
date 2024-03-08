import '../../../../../core/network/param.dart';

class SetReminderBody extends RequestBody {
  final int activateReminder;

  SetReminderBody({
    required this.activateReminder,
  });
  @override
  Map<String, dynamic> toJson() => {'activateReminder': activateReminder};
}
