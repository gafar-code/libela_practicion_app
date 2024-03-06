class CountryModel {
  String? flag;
  String? country;
  String? code;

  CountryModel({this.flag, this.country, this.code});

  CountryModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    country = json['country'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag'] = flag;
    data['country'] = country;
    data['code'] = code;
    return data;
  }
}
