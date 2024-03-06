class LoginResponseModel {
  String? otpCode;
  String? otpToken;
  String? expiryAt;

  LoginResponseModel({this.otpCode, this.otpToken, this.expiryAt});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    otpCode = json['otpCode'];
    otpToken = json['otpToken'];
    expiryAt = json['expiryAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otpCode'] = otpCode;
    data['otpToken'] = otpToken;
    data['expiryAt'] = expiryAt;
    return data;
  }
}
