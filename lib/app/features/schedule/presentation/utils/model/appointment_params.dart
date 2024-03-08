import 'package:libela_practition/app/core/network/param.dart';

class AppointmentParams extends ToJson {
  final int limit;
  final String status;

  AppointmentParams(this.limit, this.status);

  @override
  Map<String, dynamic> toJson() => {'limit': limit, 'status': status}
    ..removeWhere((key, value) => value == null || value == '');
}
