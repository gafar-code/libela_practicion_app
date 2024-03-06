import 'package:equatable/equatable.dart';

class OnboardingEntity extends Equatable {
  final String? title;
  final String? description;

  const OnboardingEntity({this.title, this.description});

  @override
  List<Object?> get props => [title, description];
}
