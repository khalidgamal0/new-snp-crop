class TransactionDetailsModel {
  final String? key;
  final String? msg;
  final TransactionDetailsModelData? data;

  TransactionDetailsModel({
    this.key,
    this.msg,
    this.data,
  });

  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) => TransactionDetailsModel(
    key: json["key"],
    msg: json["msg"],
    data: json["data"] == null ? null : TransactionDetailsModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "msg": msg,
    "data": data?.toJson(),
  };
}

class TransactionDetailsModelData {
  final int? id;
  final String? details;
  final DateTime? transactionDate;
  final String? balance;
  final String? creditor;
  final String? debtor;
  final String? printedValue;
  final String? currencyAr;
  final String? currencyEn;
  final String? notes;
  final String? reference;
  final String? transactionCode;
  final AccountInfo? accountInfo;

  TransactionDetailsModelData({
    this.id,
    this.details,
    this.transactionDate,
    this.balance,
    this.creditor,
    this.debtor,
    this.printedValue,
    this.currencyAr,
    this.currencyEn,
    this.notes,
    this.reference,
    this.transactionCode,
    this.accountInfo,
  });

  factory TransactionDetailsModelData.fromJson(Map<String, dynamic> json) => TransactionDetailsModelData(
    id: json["id"],
    details: json["details"],
    transactionDate: json["transaction_date"] == null ? null : DateTime.parse(json["transaction_date"]),
    balance: json["balance"],
    creditor: json["creditor"],
    debtor: json["debtor"],
    printedValue: json["printed_value"],
    currencyAr: json["currency_ar"],
    currencyEn: json["currency_en"],
    notes: json["notes"],
    reference: json["reference"],
    transactionCode: json["transaction_code"],
    accountInfo: json["account_info"] == null ? null : AccountInfo.fromJson(json["account_info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "details": details,
    "transaction_date": "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
    "balance": balance,
    "creditor": creditor,
    "debtor": debtor,
    "printed_value": printedValue,
    "currency_ar": currencyAr,
    "currency_en": currencyEn,
    "notes": notes,
    "reference": reference,
    "transaction_code": transactionCode,
    "account_info": accountInfo?.toJson(),
  };
}

class AccountInfo {
  final int? id;
  final String? accountNumber;
  final String? status;
  final String? accountName;
  final String? shortName;
  final String? balance;
  final String? currencyAr;
  final String? currencyEn;
  final String? iban;
  final String? availableBalance;
  final String? reservedBalance;
  final String? overdraftLimit;

  AccountInfo({
    this.id,
    this.accountNumber,
    this.status,
    this.accountName,
    this.shortName,
    this.balance,
    this.currencyAr,
    this.currencyEn,
    this.iban,
    this.availableBalance,
    this.reservedBalance,
    this.overdraftLimit,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
    id: json["id"],
    accountNumber: json["account_number"],
    status: json["status"],
    accountName: json["account_name"],
    shortName: json["short_name"],
    balance: json["balance"],
    currencyAr: json["currency_ar"],
    currencyEn: json["currency_en"],
    iban: json["iban"],
    availableBalance: json["available_balance"],
    reservedBalance: json["reserved_balance"],
    overdraftLimit: json["overdraft_limit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_number": accountNumber,
    "status": status,
    "account_name": accountName,
    "short_name": shortName,
    "balance": balance,
    "currency_ar": currencyAr,
    "currency_en": currencyEn,
    "iban": iban,
    "available_balance": availableBalance,
    "reserved_balance": reservedBalance,
    "overdraft_limit": overdraftLimit,
  };
}
