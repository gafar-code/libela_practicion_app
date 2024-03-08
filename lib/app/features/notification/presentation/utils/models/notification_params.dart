import '../../../../../core/network/param.dart';

class NotificationParams extends ToJson {
  final int limit;

  NotificationParams(this.limit);

  @override
  Map<String, dynamic> toJson() => {'limit': limit}
    ..removeWhere((key, value) => value == null || value == '');
}
