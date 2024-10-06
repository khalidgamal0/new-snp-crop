class BasicInfoModel{
  String? userName;
  String? userNumber;
  String? verifyCode;
  BasicInfoModel.fromJson(Map<String,dynamic>json){
    userName=json['user_name'];
    userNumber=json['user_number'];
    verifyCode=json['verifiy_code'];
  }
}



class AccountSetting{
  String? accountId;
  String? accountName;
  String? verifyPhone;
  AccountSetting.fromJson(Map<String,dynamic>json){
    accountId=json['account_id'];
    accountName=json['account_name'];
    verifyPhone=json['verification_phone'];
  }
}