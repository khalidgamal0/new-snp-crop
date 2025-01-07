part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}


final class BasicInfoLoading extends SplashState {}
final class BasicInfoSuccess extends SplashState {}
final class BasicInfoError extends SplashState {}

final class ActiveAccountsLoading extends SplashState {}
final class ActiveAccountsSuccess extends SplashState {}
final class ActiveAccountsError extends SplashState {}

final class AccountDetailsLoading extends SplashState {}
final class AccountDetailsSuccess extends SplashState {}
final class AccountDetailsError extends SplashState {}


final class TransactionLoading extends SplashState {}
final class TransactionSuccess extends SplashState {}
final class TransactionError extends SplashState {}

final class TransactionDetailsLoading extends SplashState {}
final class TransactionDetailsSuccess extends SplashState {}
final class TransactionDetailsError extends SplashState {}
final class AccountTransactionLoading extends SplashState {}
final class AccountTransactionSuccess extends SplashState {}
final class AccountTransactionError extends SplashState {}
final class XlsxLoading extends SplashState {}
final class XlsxSuccess extends SplashState {}
final class XlsxError extends SplashState {}




