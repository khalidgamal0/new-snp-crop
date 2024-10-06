class AccountDetailsModel{
  String? accountNumber;
  String? balance;
  String? currency;
  String? currentBalance;
  String? innerName;
  String? iPan;
  String? observationName;
  String? outerBalance;
  String? outerName;
  String? overLimited;
  String? reservedAmount;
  String? status;
  AccountDetailsModel.fromJson(Map<String,dynamic>json){
    accountNumber=json['account_numbert'];
    balance=json['balance'];
    currency=json['currency'];
    currentBalance=json['cuurent_balance'];
    innerName=json['inner_name'];
    iPan=json['ipan'];
    observationName=json['observation_name'];
    outerBalance=json['outer_balance'];
    outerName=json['outer_name'];
    overLimited=json['over_imitited'];
    reservedAmount=json['reserved_amount'];
    status=json['status'];
  }

}

//api
class AccountDetailsModelApi {
  final String? key;
  final String? msg;
  final AccountDetailsModelApiData? data;

  AccountDetailsModelApi({
    this.key,
    this.msg,
    this.data,
  });

  factory AccountDetailsModelApi.fromJson(Map<String, dynamic> json) => AccountDetailsModelApi(
    key: json["key"],
    msg: json["msg"],
    data: json["data"] == null ? null : AccountDetailsModelApiData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "msg": msg,
    "data": data?.toJson(),
  };
}

class AccountDetailsModelApiData {
  final int? id;
  final String? accountNumber;
  final String? status;
  final String? accountName;
  final String? shortName;
  final String? balance;
  final CurrencyAr? currencyAr;
  final CurrencyEn? currencyEn;
  final String? iban;
  final String? availableBalance;
  final String? reservedBalance;
  final String? overdraftLimit;
  final List<Transaction>? lastTransactions;

  AccountDetailsModelApiData({
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
    this.lastTransactions,
  });

  factory AccountDetailsModelApiData.fromJson(Map<String, dynamic> json) => AccountDetailsModelApiData(
    id: json["id"],
    accountNumber: json["account_number"],
    status: json["status"],
    accountName: json["account_name"],
    shortName: json["short_name"],
    balance: json["balance"],
    currencyAr: currencyArValues.map[json["currency_ar"]]!,
    currencyEn: currencyEnValues.map[json["currency_en"]]!,
    iban: json["iban"],
    availableBalance: json["available_balance"],
    reservedBalance: json["reserved_balance"],
    overdraftLimit: json["overdraft_limit"],
    lastTransactions: json["last_transactions"] == null ? [] : List<Transaction>.from(json["last_transactions"]!.map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_number": accountNumber,
    "status": status,
    "account_name": accountName,
    "short_name": shortName,
    "balance": balance,
    "currency_ar": currencyArValues.reverse[currencyAr],
    "currency_en": currencyEnValues.reverse[currencyEn],
    "iban": iban,
    "available_balance": availableBalance,
    "reserved_balance": reservedBalance,
    "overdraft_limit": overdraftLimit,
    "last_transactions": lastTransactions == null ? [] : List<dynamic>.from(lastTransactions!.map((x) => x.toJson())),
  };
}

enum CurrencyAr {
  EMPTY
}

final currencyArValues = EnumValues({
  "ر.س": CurrencyAr.EMPTY
});

enum CurrencyEn {
  SAR
}

final currencyEnValues = EnumValues({
  "SAR": CurrencyEn.SAR
});

class Transaction {
  final int? id;
  final String? details;
  final DateTime? transactionDate;
  final String? balance;
  final String? creditor;
  final String? debtor;
  final String? printedValue;
  final CurrencyAr? currencyAr;
  final CurrencyEn? currencyEn;

  Transaction({
    this.id,
    this.details,
    this.transactionDate,
    this.balance,
    this.creditor,
    this.debtor,
    this.printedValue,
    this.currencyAr,
    this.currencyEn,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    details: json["details"],
    transactionDate: json["transaction_date"] == null ? null : DateTime.parse(json["transaction_date"]),
    balance: json["balance"],
    creditor: json["creditor"],
    debtor: json["debtor"],
    printedValue: json["printed_value"],
    currencyAr: currencyArValues.map[json["currency_ar"]]!,
    currencyEn: currencyEnValues.map[json["currency_en"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "details": details,
    "transaction_date": "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
    "balance": balance,
    "creditor": creditor,
    "debtor": debtor,
    "printed_value": printedValue,
    "currency_ar": currencyArValues.reverse[currencyAr],
    "currency_en": currencyEnValues.reverse[currencyEn],
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
