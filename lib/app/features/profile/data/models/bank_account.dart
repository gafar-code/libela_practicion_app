class BankAccountModel {
  int? id;
  int? bankId;
  String? bankAccount;
  String? bankAccountName;
  int? isPrimaryBank;
  String? bankName;
  String? bankCode;
  String? bankAlias;
  String? bankColor;

  BankAccountModel(
      {this.id,
      this.bankId,
      this.bankAccount,
      this.bankAccountName,
      this.isPrimaryBank,
      this.bankName,
      this.bankCode,
      this.bankAlias,
      this.bankColor});

  BankAccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankId = json['bankId'];
    bankAccount = json['bankAccount'];
    bankAccountName = json['bankAccountName'];
    isPrimaryBank = json['isPrimaryBank'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
    bankAlias = json['bankAlias'];
    bankColor = json['bankColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankId'] = this.bankId;
    data['bankAccount'] = this.bankAccount;
    data['bankAccountName'] = this.bankAccountName;
    data['isPrimaryBank'] = this.isPrimaryBank;
    data['bankName'] = this.bankName;
    data['bankCode'] = this.bankCode;
    data['bankAlias'] = this.bankAlias;
    data['bankColor'] = this.bankColor;
    return data;
  }
}
