class ProfessionsModel {
  String? id;
  String? professionName;
  List<SubProfession>? subProfession;

  ProfessionsModel({this.id, this.professionName, this.subProfession});

  ProfessionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionName = json['professionName'];
    if (json['subProfession'] != null) {
      subProfession = <SubProfession>[];
      json['subProfession'].forEach((v) {
        subProfession!.add(SubProfession.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['professionName'] = professionName;
    if (subProfession != null) {
      data['subProfession'] = subProfession!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubProfession {
  String? id;
  String? professionId;
  String? subProfessionName;
  String? slug;
  String? createdAt;
  String? updatedAt;

  SubProfession(
      {this.id,
      this.professionId,
      this.subProfessionName,
      this.slug,
      this.createdAt,
      this.updatedAt});

  SubProfession.fromJson(Map<String, dynamic> json) {
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
