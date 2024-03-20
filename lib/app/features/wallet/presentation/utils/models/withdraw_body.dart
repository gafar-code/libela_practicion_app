import '../../../../../core/network/param.dart';

class WithdrawBody extends RequestBody {
  final int withdrawAmount;
  final List<FeesBody>? fees;

  WithdrawBody({
    required this.withdrawAmount,
    this.fees,
  });

  @override
  Map<String, dynamic> toJson() => {
        'withdrawAmount': withdrawAmount,
        'fees': fees?.map((e) => e.toJson()).toList()
      }..removeWhere((key, value) => value == null);
}

class FeesBody {
  final String? type;
  final int? value;

  FeesBody({this.type, this.value});

  Map<String, dynamic> toJson() => {'type': type, 'value': value}
    ..removeWhere((key, value) => value == null);
}
