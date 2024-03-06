import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String? flag;
  final String? country;
  final String? code;

  const CountryEntity({this.flag, this.country, this.code});

  @override
  List<Object?> get props => [flag, country, code];
}
