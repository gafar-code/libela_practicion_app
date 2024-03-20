import '../../../../../core/network/param.dart';

class WalletLimitParams extends ToJson {
  final int limit;

  WalletLimitParams(this.limit);

  @override
  Map<String, dynamic> toJson() => {'limit': limit}
    ..removeWhere((key, value) => value == null || value == '');
}
