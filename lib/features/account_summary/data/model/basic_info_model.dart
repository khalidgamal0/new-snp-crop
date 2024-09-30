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