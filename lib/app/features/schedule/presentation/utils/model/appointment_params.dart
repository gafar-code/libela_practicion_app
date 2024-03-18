import 'package:libela_practition/app/core/network/param.dart';

class AppointmentParams extends ToJson {
  final int limit;
  final String status;
  final String? byDate;
  final String? patientName;

  AppointmentParams(this.limit, this.status, [this.byDate, this.patientName]);

  @override
  Map<String, dynamic> toJson() => {
        'limit': limit,
        'status': status,
        'byDate': byDate,
        'patientName': patientName
      }..removeWhere((key, value) => value == null || value == '');
}
