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