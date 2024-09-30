import 'dart:developer';

import 'package:artificial_intelligence/features/account_summary/data/model/basic_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../account_summary/data/model/account_details_model.dart';
import '../../account_summary/data/model/transaction_model.dart';
part 'splash_state.dart';


BasicInfoModel? basicInfoModel;
AccountDetailsModel? accountDetailsModel;
List<TransactionModel> transactionModel=[];
List<TransactionModel> filterTransactionModel=[];


List<TransactionModel> filterLogsByDate(String start, String end) {
  DateTime startDate = DateTime.parse(start);
  DateTime endDate = DateTime.parse(end);
  filterTransactionModel=transactionModel;

  return filterTransactionModel.where((log) {
    DateTime logDate = DateTime.parse(log.time??'2023-09-15');
    return logDate.isAfter(startDate) && logDate.isBefore(endDate);
  }).toList();
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(context)=> BlocProvider.of(context);


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
    emit(AccountTransactionLoading());
    try{
      var collRef=await FirebaseFirestore.instance.collection('account_details').doc('27400000535107').collection('transaction').get();
      for (var element in collRef.docs) {
        log('${element.data()}');
        transactionModel.add(TransactionModel.fromJson(element.data()));
      }
      emit(AccountTransactionSuccess  ());

    }catch(error){
      emit(AccountTransactionError());
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


  // DateTime parseDate(String dateString) {
  //   List<String> parts = dateString.split('-');
  //   int day = int.parse(parts[0]);
  //   int month = int.parse(parts[1]);
  //   int year = int.parse(parts[2]);
  //   return DateTime(year, month, day);
  // }


}
