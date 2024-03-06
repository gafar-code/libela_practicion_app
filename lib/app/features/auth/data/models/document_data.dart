class DocumentDataModel {
  int? id;
  String? createdAt;
  String? updatedAt;

  DocumentDataModel({this.id, this.createdAt, this.updatedAt});

  DocumentDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
