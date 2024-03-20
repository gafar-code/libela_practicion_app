class BanksModel {
  int? bankId;
  String? bankName;
  String? bankAlias;
  String? bankCode;
  int? bankOrder;
  String? bankColor;
  int? bankStatus;

  BanksModel(
      {this.bankId,
      this.bankName,
      this.bankAlias,
      this.bankCode,
      this.bankOrder,
      this.bankColor,
      this.bankStatus});

  BanksModel.fromJson(Map<String, dynamic> json) {
    bankId = json['bankId'];
    bankName = json['bankName'];
    bankAlias = json['bankAlias'];
    bankCode = json['bankCode'];
    bankOrder = json['bankOrder'];
    bankColor = json['bankColor'];
    bankStatus = json['bankStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankId'] = this.bankId;
    data['bankName'] = this.bankName;
    data['bankAlias'] = this.bankAlias;
    data['bankCode'] = this.bankCode;
    data['bankOrder'] = this.bankOrder;
    data['bankColor'] = this.bankColor;
    data['bankStatus'] = this.bankStatus;
    return data;
  }
}
