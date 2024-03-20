class TransactionHistoryModel {
  String? id;
  String? financeId;
  String? walletId;
  String? item;
  int? amount;
  String? transactionType;
  String? transactionStatus;
  String? transactionLineType;
  String? transactionCode;
  String? bankName;
  String? bankCode;
  String? accountNumber;
  String? accountName;
  String? accountIdentity;
  String? accountPhoneNumber;
  String? createdAt;

  TransactionHistoryModel(
      {this.id,
      this.financeId,
      this.walletId,
      this.item,
      this.amount,
      this.transactionType,
      this.transactionStatus,
      this.transactionLineType,
      this.transactionCode,
      this.bankName,
      this.bankCode,
      this.accountNumber,
      this.accountName,
      this.accountIdentity,
      this.accountPhoneNumber,
      this.createdAt});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    financeId = json['financeId'];
    walletId = json['walletId'];
    item = json['item'];
    amount = json['amount'];
    transactionType = json['transactionType'];
    transactionStatus = json['transactionStatus'];
    transactionLineType = json['transactionLineType'];
    transactionCode = json['transactionCode'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    accountIdentity = json['accountIdentity'];
    accountPhoneNumber = json['accountPhoneNumber'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['financeId'] = this.financeId;
    data['walletId'] = this.walletId;
    data['item'] = this.item;
    data['amount'] = this.amount;
    data['transactionType'] = this.transactionType;
    data['transactionStatus'] = this.transactionStatus;
    data['transactionLineType'] = this.transactionLineType;
    data['transactionCode'] = this.transactionCode;
    data['bankName'] = this.bankName;
    data['bankCode'] = this.bankCode;
    data['accountNumber'] = this.accountNumber;
    data['accountName'] = this.accountName;
    data['accountIdentity'] = this.accountIdentity;
    data['accountPhoneNumber'] = this.accountPhoneNumber;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
