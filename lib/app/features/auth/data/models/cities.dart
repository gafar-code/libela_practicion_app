class CitiesModel {
  int? id;
  int? provinceId;
  String? name;

  CitiesModel({this.id, this.provinceId, this.name});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceId = json['provinceId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['provinceId'] = provinceId;
    data['name'] = name;
    return data;
  }
}
