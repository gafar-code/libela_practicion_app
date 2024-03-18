class UploadImageModel {
  String? data;

  UploadImageModel({this.data});

  UploadImageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }
}
