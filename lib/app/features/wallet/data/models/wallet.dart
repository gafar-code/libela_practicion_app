class WalletModel {
  String? id;
  String? practitionersId;
  String? currency;
  String? balance;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  int? point;

  WalletModel(
      {this.id,
      this.practitionersId,
      this.currency,
      this.balance,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.point});

  WalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    practitionersId = json['practitionersId'];
    currency = json['currency'];
    balance = json['balance'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['practitionersId'] = this.practitionersId;
    data['currency'] = this.currency;
    data['balance'] = this.balance;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['point'] = this.point;
    return data;
  }
}
