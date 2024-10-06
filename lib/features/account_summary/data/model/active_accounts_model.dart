class ActiveAccountModel {
  final String? key;
  final String? msg;
  final List<ActiveAccountData>? data;

  ActiveAccountModel({
    this.key,
    this.msg,
    this.data,
  });

  factory ActiveAccountModel.fromJson(Map<String, dynamic> json) => ActiveAccountModel(
    key: json["key"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<ActiveAccountData>.from(json["data"]!.map((x) => ActiveAccountData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ActiveAccountData {
  final int? id;
  final String? accountNumber;
  final String? status;
  final String? accountName;
  final String? shortName;
  final String? balance;
  final String? currencyAr;
  final String? currencyEn;

  ActiveAccountData({
    this.id,
    this.accountNumber,
    this.status,
    this.accountName,
    this.shortName,
    this.balance,
    this.currencyAr,
    this.currencyEn,
  });

  factory ActiveAccountData.fromJson(Map<String, dynamic> json) => ActiveAccountData(
    id: json["id"],
    accountNumber: json["account_number"],
    status: json["status"],
    accountName: json["account_name"],
    shortName: json["short_name"],
    balance: json["balance"],
    currencyAr: json["currency_ar"],
    currencyEn: json["currency_en"],
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
  };
}
