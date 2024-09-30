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