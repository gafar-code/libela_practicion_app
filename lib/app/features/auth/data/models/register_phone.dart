class RegisterPhoneModel {
  String? otpCode;
  String? otpToken;
  String? expiryAt;
  String? phoneNumber;

  RegisterPhoneModel(
      {this.otpCode, this.otpToken, this.expiryAt, this.phoneNumber});

  RegisterPhoneModel.fromJson(Map<String, dynamic> json) {
    otpCode = json['otpCode'];
    otpToken = json['otpToken'];
    expiryAt = json['expiryAt'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otpCode'] = otpCode;
    data['otpToken'] = otpToken;
    data['expiryAt'] = expiryAt;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
