import 'dart:developer';

import 'package:artificial_intelligence/features/account_summary/data/model/active_accounts_model.dart';
import 'package:artificial_intelligence/features/account_summary/data/model/basic_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/dio.dart';
import '../../account_summary/data/model/account_details_model.dart';
import '../../account_summary/data/model/transaction_details_model.dart';
import '../../account_summary/data/model/transaction_model.dart';
part 'splash_state.dart';

//fire base
BasicInfoModel? basicInfoModel;
AccountDetailsModel? accountDetailsModel;
List<TransactionModel> transactionModel=[];
List<TransactionModel> filterTransactionModel=[];
DateTime parseDate(String dateString) {
  List<String> parts = dateString.split('-');
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);
  return DateTime(year, month, day);
}
void filterLogsByDate(String start, String end) {
  // Parse start and end dates from the input strings
  DateTime startDate = parseDate(start);
  DateTime endDate = parseDate(end);

  // Clear the filtered list before adding new entries
  filterTransactionModel.clear();

  // Filter transactionModel based on the date range
  for (var log in transactionModel) {
    DateTime logDate = parseDate(log.time!);

    // Check if the logDate is within the range (including start and end)
    if ((logDate.isAfter(startDate) || logDate.isAtSameMomentAs(startDate)) &&
        (logDate.isBefore(endDate) || logDate.isAtSameMomentAs(endDate))) {
      filterTransactionModel.add(log);
    }
  }

  // Log the number of filtered transactions
  log('Filtered transactions count: ${filterTransactionModel.length}');
}

//api
AccountSetting? accountSetting;
ActiveAccountModel? activeAccountModel;



class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(context)=> BlocProvider.of(context);
  //fire base
  Future<void>getBasicInfo()async{
    emit(BasicInfoLoading());
    FirebaseFirestore.instance.collection('basic-info').doc('1010876749').get().then((value){
      log('doneeeeeeeeeeeeeee');
      log('${
          value.data()!
      }');

      basicInfoModel=BasicInfoModel.fromJson(value.data()!);
      log('doneeeeeeeeeeeeeee2222222222');

      emit(BasicInfoSuccess());
    }).catchError((error){
      emit(BasicInfoError());

    });
  }
  Future<void>getAccountDetails()async{
    emit(AccountDetailsLoading());
    FirebaseFirestore.instance.collection('account_details').doc('27400000535107').get().then((value){
      log('${
          value.data()!
      }');

      accountDetailsModel=AccountDetailsModel.fromJson(value.data()!);
      log('success');

      emit(AccountDetailsSuccess());
    }).catchError((error){
      emit(AccountDetailsError());

    });
  }
  Future<void>getAccountTransaction()async{
    emit(TransactionLoading());
    try{
      var collRef=await FirebaseFirestore.instance.collection('account_details').doc('27400000535107').collection('transaction').get();
      for (var element in collRef.docs) {
        log('${element.data()}');
        transactionModel.add(TransactionModel.fromJson(element.data()));
      }
      emit(TransactionSuccess  ());

    }catch(error){
      emit(TransactionError());
    }
  }
  // Future<void>getAccountTransactionFilter()async{
  //   emit(AccountTransactionLoading());
  //   try{
  //     var collRef=await FirebaseFirestore.instance.collection('account_details').doc('27400000535107').collection('transaction').get();
  //     for (var element in collRef.docs) {
  //       log('${element.data()}');
  //
  //       filterTransactionModel.add(TransactionModel.fromJson(element.data()));
  //     }
  //     emit(AccountTransactionSuccess  ());
  //
  //   }catch(error){
  //     emit(AccountTransactionError());
  //   }
  // }

//api

  Future<void>getAccountSetting()async{
    emit(BasicInfoLoading());
   await DioHelper.getData(endPoint:'settings').then((value){
      accountSetting=AccountSetting.fromJson(value['data']);
      emit(BasicInfoSuccess());
    }).catchError((error){
      log(error.toString());
      emit(BasicInfoError());
    });
  }

  Future<void>getActiveAccounts()async{
    emit(ActiveAccountsLoading());
   await DioHelper.getData(endPoint:'accounts').then((value){
      activeAccountModel=ActiveAccountModel.fromJson(value);
      emit(ActiveAccountsSuccess());
    }).catchError((error){
      log(error.toString());
      emit(ActiveAccountsError());
    });
  }

  AccountDetailsModelApi? accountDetailsModelApi;
  Future<void>getAccountDetailsById({required String id})async{
    emit(AccountDetailsLoading());
    await DioHelper.getData(endPoint:'accounts/$id/details').then((value){
      accountDetailsModelApi=AccountDetailsModelApi.fromJson(value);
      emit(AccountDetailsSuccess());
    }).catchError((error){
      log(error.toString());
      emit(AccountDetailsError());
    });
  }

  FilterTransactionModel ?filterTransactionModelApi;
  Future<void>getFilterTransaction({required String id,required String startDate,required String endDate,})async{
    emit(TransactionLoading());
    await DioHelper.postData(endPoint:'transactions/filtered-transactions', data: {
      'account_id':id,
      'start_date':startDate,
      'end_date':endDate,
    }).then((value){
      filterTransactionModelApi=FilterTransactionModel.fromJson(value);
      emit(TransactionSuccess());
    }).catchError((error){
      log(error.toString());
      emit(TransactionError());
    });
  }

  TransactionDetailsModel ?transactionDetailsModel;
  Future<void>getTransactionDetails({required String id,})async{
    emit(TransactionDetailsLoading());
    DioHelper.getData(endPoint:'transactions/$id/details', ).then((value){
      transactionDetailsModel=TransactionDetailsModel.fromJson(value);
      emit(TransactionDetailsSuccess());
    }).catchError((error){
      log(error.toString());
      emit(TransactionDetailsError());
    });
  }






}
