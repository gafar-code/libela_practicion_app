class TransactionLineModel {
  String? id;
  String? item;
  String? walletId;
  int? amount;
  String? transactionType;
  String? transactionStatus;
  String? transactionLineType;
  String? createdAt;
  String? updatedAt;

  TransactionLineModel(
      {this.id,
      this.item,
      this.walletId,
      this.amount,
      this.transactionType,
      this.transactionStatus,
      this.transactionLineType,
      this.createdAt,
      this.updatedAt});

  TransactionLineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    walletId = json['walletId'];
    amount = json['amount'];
    transactionType = json['transactionType'];
    transactionStatus = json['transactionStatus'];
    transactionLineType = json['transactionLineType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item'] = this.item;
    data['walletId'] = this.walletId;
    data['amount'] = this.amount;
    data['transactionType'] = this.transactionType;
    data['transactionStatus'] = this.transactionStatus;
    data['transactionLineType'] = this.transactionLineType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
