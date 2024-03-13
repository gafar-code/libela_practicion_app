import '../../../../../core/network/param.dart';

class PendingAppointmentParams extends ToJson {
  final int limit;

  PendingAppointmentParams(this.limit);

  @override
  Map<String, dynamic> toJson() => {'limit': limit}
    ..removeWhere((key, value) => value == null || value == '');
}
