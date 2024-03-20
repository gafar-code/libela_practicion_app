class WithdrawRequestModel {
  String? id;
  String? transactionStatus;
  String? refCode;
  String? createdAt;

  WithdrawRequestModel(
      {this.id, this.transactionStatus, this.refCode, this.createdAt});

  WithdrawRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionStatus = json['transactionStatus'];
    refCode = json['refCode'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transactionStatus'] = this.transactionStatus;
    data['refCode'] = this.refCode;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
