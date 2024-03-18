class UpdateProfileModel {
  String? avatar;
  String? aboutme;

  UpdateProfileModel({this.avatar, this.aboutme});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    aboutme = json['aboutme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['aboutme'] = this.aboutme;
    return data;
  }
}
