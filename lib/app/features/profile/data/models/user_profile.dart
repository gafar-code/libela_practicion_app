class UserProfileModel {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? practitionPhone;
  String? dateOfBirth;
  String? address;
  String? avatar;
  int? isEmailVerified;
  String? userLoginLast;
  int? isApproved;
  String? userApprovalDate;
  String? gender;
  String? education;
  ProfessionsUserModel? professions;
  List<RolesUserModel>? roles;
  List<PractitionerServiceAreaUserModel>? practitionerServiceArea;
  List<PractititonerServiceSkillUserModel>? practititonerServiceSkill;
  bool? isRegistrationComplete;
  RegistrationCompletionModel? registrationCompletion;

  UserProfileModel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.practitionPhone,
      this.dateOfBirth,
      this.address,
      this.avatar,
      this.isEmailVerified,
      this.userLoginLast,
      this.isApproved,
      this.userApprovalDate,
      this.gender,
      this.education,
      this.professions,
      this.roles,
      this.practitionerServiceArea,
      this.practititonerServiceSkill,
      this.isRegistrationComplete,
      this.registrationCompletion});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    practitionPhone = json['practitionPhone'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    avatar = json['avatar'];
    isEmailVerified = json['isEmailVerified'];
    userLoginLast = json['userLoginLast'];
    isApproved = json['isApproved'];
    userApprovalDate = json['userApprovalDate'];
    gender = json['gender'];
    education = json['education'];
    professions = json['professions'] != null
        ? ProfessionsUserModel.fromJson(json['professions'])
        : null;
    if (json['roles'] != null) {
      roles = <RolesUserModel>[];
      json['roles'].forEach((v) {
        roles!.add(RolesUserModel.fromJson(v));
      });
    }
    if (json['practitionerServiceArea'] != null) {
      practitionerServiceArea = <PractitionerServiceAreaUserModel>[];
      json['practitionerServiceArea'].forEach((v) {
        practitionerServiceArea!
            .add(PractitionerServiceAreaUserModel.fromJson(v));
      });
    }
    if (json['practititonerServiceSkill'] != null) {
      practititonerServiceSkill = <PractititonerServiceSkillUserModel>[];
      json['practititonerServiceSkill'].forEach((v) {
        practititonerServiceSkill!
            .add(PractititonerServiceSkillUserModel.fromJson(v));
      });
    }
    isRegistrationComplete = json['isRegistrationComplete'];
    registrationCompletion = json['registrationCompletion'] != null
        ? RegistrationCompletionModel.fromJson(json['registrationCompletion'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['practitionPhone'] = practitionPhone;
    data['dateOfBirth'] = dateOfBirth;
    data['address'] = address;
    data['avatar'] = avatar;
    data['isEmailVerified'] = isEmailVerified;
    data['userLoginLast'] = userLoginLast;
    data['isApproved'] = isApproved;
    data['userApprovalDate'] = userApprovalDate;
    data['gender'] = gender;
    data['education'] = education;
    if (professions != null) {
      data['professions'] = professions!.toJson();
    }
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    if (practitionerServiceArea != null) {
      data['practitionerServiceArea'] =
          practitionerServiceArea!.map((v) => v.toJson()).toList();
    }
    if (practititonerServiceSkill != null) {
      data['practititonerServiceSkill'] =
          practititonerServiceSkill!.map((v) => v.toJson()).toList();
    }
    data['isRegistrationComplete'] = isRegistrationComplete;
    if (registrationCompletion != null) {
      data['registrationCompletion'] = registrationCompletion!.toJson();
    }
    return data;
  }
}

class ProfessionsUserModel {
  String? id;
  String? professionName;

  ProfessionsUserModel({this.id, this.professionName});

  ProfessionsUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionName = json['professionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['professionName'] = professionName;
    return data;
  }
}

class RolesUserModel {
  String? id;
  String? name;

  RolesUserModel({this.id, this.name});

  RolesUserModel.fromJson(Map<String, dynamic> json) {
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

class PractitionerServiceAreaUserModel {
  int? id;
  int? serviceAreasId;
  ServiceAreasUserModel? serviceAreas;

  PractitionerServiceAreaUserModel(
      {this.id, this.serviceAreasId, this.serviceAreas});

  PractitionerServiceAreaUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceAreasId = json['serviceAreasId'];
    serviceAreas = json['serviceAreas'] != null
        ? ServiceAreasUserModel.fromJson(json['serviceAreas'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serviceAreasId'] = serviceAreasId;
    if (serviceAreas != null) {
      data['serviceAreas'] = serviceAreas!.toJson();
    }
    return data;
  }
}

class ServiceAreasUserModel {
  String? name;

  ServiceAreasUserModel({this.name});

  ServiceAreasUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class PractititonerServiceSkillUserModel {
  int? id;
  String? skillsId;
  SkillsUserModel? skills;

  PractititonerServiceSkillUserModel({this.id, this.skillsId, this.skills});

  PractititonerServiceSkillUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillsId = json['skillsId'];
    skills = json['skills'] != null
        ? SkillsUserModel.fromJson(json['skills'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['skillsId'] = skillsId;
    if (skills != null) {
      data['skills'] = skills!.toJson();
    }
    return data;
  }
}

class SkillsUserModel {
  String? subProfessionName;

  SkillsUserModel({this.subProfessionName});

  SkillsUserModel.fromJson(Map<String, dynamic> json) {
    subProfessionName = json['subProfessionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subProfessionName'] = subProfessionName;
    return data;
  }
}

class RegistrationCompletionModel {
  bool? step1;
  bool? step2;
  bool? step3;
  bool? step4;
  bool? step5;

  RegistrationCompletionModel(
      {this.step1, this.step2, this.step3, this.step4, this.step5});

  RegistrationCompletionModel.fromJson(Map<String, dynamic> json) {
    step1 = json['step1'];
    step2 = json['step2'];
    step3 = json['step3'];
    step4 = json['step4'];
    step5 = json['step5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['step1'] = step1;
    data['step2'] = step2;
    data['step3'] = step3;
    data['step4'] = step4;
    data['step5'] = step5;
    return data;
  }
}
