import 'package:equatable/equatable.dart';

import '../../data/models/faq.dart';

class FaqEntity extends Equatable {
  final int? id;
  final int? sequence;
  final String? title;
  final String? description;
  final int? status;

  FaqEntity(
      {this.id, this.sequence, this.title, this.description, this.status});

  factory FaqEntity.fromModel(FaqModel model) {
    return FaqEntity(
      id: model.id,
      sequence: model.sequence,
      title: model.title,
      description: model.description,
      status: model.status,
    );
  }

  @override
  List<Object?> get props => [id, sequence, title, description, status];
}
