class PersonalDataModel {
  String? id;
  String? email;
  String? firstName;
  ProfessionsDataModel? professions;
  List<RolesModel>? roles;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  int? provinceId;
  int? cityId;
  String? address;
  String? professionsId;
  String? practitionPhone;
  String? avatar;

  PersonalDataModel(
      {this.id,
      this.email,
      this.firstName,
      this.professions,
      this.roles,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.provinceId,
      this.cityId,
      this.address,
      this.professionsId,
      this.practitionPhone,
      this.avatar});

  PersonalDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    if (json['professions'] != null) {
      professions = ProfessionsDataModel.fromJson(json['professions']);
    }
    if (json['roles'] != null) {
      roles = <RolesModel>[];
      json['roles'].forEach((v) {
        roles!.add(RolesModel.fromJson(v));
      });
    }
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    address = json['address'];
    professionsId = json['professionsId'];
    practitionPhone = json['practitionPhone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['professions'] = professions!.toJson();
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['lastName'] = lastName;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['provinceId'] = provinceId;
    data['cityId'] = cityId;
    data['address'] = address;
    data['professionsId'] = professionsId;
    data['practitionPhone'] = practitionPhone;
    data['avatar'] = avatar;
    return data;
  }
}

class RolesModel {
  String? id;
  String? name;

  RolesModel({this.id, this.name});

  RolesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ProfessionsDataModel {
  String? id;
  String? professionName;
  String? createdAt;
  String? updatedAt;

  ProfessionsDataModel(
      {this.id, this.professionName, this.createdAt, this.updatedAt});

  ProfessionsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionName = json['professionName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['professionName'] = professionName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
