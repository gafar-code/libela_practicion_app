class SpecializationModel {
  String? id;
  String? professionId;
  String? subProfessionName;
  String? slug;
  String? createdAt;
  String? updatedAt;

  SpecializationModel(
      {this.id,
      this.professionId,
      this.subProfessionName,
      this.slug,
      this.createdAt,
      this.updatedAt});

  SpecializationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionId = json['professionId'];
    subProfessionName = json['subProfessionName'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['professionId'] = professionId;
    data['subProfessionName'] = subProfessionName;
    data['slug'] = slug;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
