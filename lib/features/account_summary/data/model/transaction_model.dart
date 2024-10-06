import 'account_details_model.dart';

class TransactionModel{
  String? operationName;
  String? balance;
  String? tax;
  String? time;
  TransactionModel.fromJson(Map<String,dynamic>json){
    operationName=json['operation_name'];
    balance=json['balance'];
    tax=json['tax'];
    time=json['time'];
  }
}


// api
class FilterTransactionModel {
  final String? key;
  final String? msg;
  final FilterTransactionModelData? data;

  FilterTransactionModel({
    this.key,
    this.msg,
    this.data,
  });

  factory FilterTransactionModel.fromJson(Map<String, dynamic> json) => FilterTransactionModel(
    key: json["key"],
    msg: json["msg"],
    data: json["data"] == null ? null : FilterTransactionModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "msg": msg,
    "data": data?.toJson(),
  };
}

class FilterTransactionModelData {
  final List<Transaction>? transactions;
  final Pagination? pagination;

  FilterTransactionModelData({
    this.transactions,
    this.pagination,
  });

  factory FilterTransactionModelData.fromJson(Map<String, dynamic> json) => FilterTransactionModelData(
    transactions: json["transactions"] == null ? [] : List<Transaction>.from(json["transactions"]!.map((x) => Transaction.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  final int? totalItems;
  final int? countItems;
  final int? perPage;
  final int? totalPages;
  final int? currentPage;
  final String? nextPageUrl;
  final String? pervPageUrl;

  Pagination({
    this.totalItems,
    this.countItems,
    this.perPage,
    this.totalPages,
    this.currentPage,
    this.nextPageUrl,
    this.pervPageUrl,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalItems: json["total_items"],
    countItems: json["count_items"],
    perPage: json["per_page"],
    totalPages: json["total_pages"],
    currentPage: json["current_page"],
    nextPageUrl: json["next_page_url"],
    pervPageUrl: json["perv_page_url"],
  );

  Map<String, dynamic> toJson() => {
    "total_items": totalItems,
    "count_items": countItems,
    "per_page": perPage,
    "total_pages": totalPages,
    "current_page": currentPage,
    "next_page_url": nextPageUrl,
    "perv_page_url": pervPageUrl,
  };
}

