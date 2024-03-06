class UploadFileModel {
  String? presingedUrl;
  String? key;

  UploadFileModel({this.presingedUrl, this.key});

  UploadFileModel.fromJson(Map<String, dynamic> json) {
    presingedUrl = json['presingedUrl'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['presingedUrl'] = presingedUrl;
    data['key'] = key;
    return data;
  }
}
