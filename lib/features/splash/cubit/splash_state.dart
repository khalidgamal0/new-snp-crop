part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}


final class BasicInfoLoading extends SplashState {}
final class BasicInfoSuccess extends SplashState {}
final class BasicInfoError extends SplashState {}


final class AccountDetailsLoading extends SplashState {}
final class AccountDetailsSuccess extends SplashState {}
final class AccountDetailsError extends SplashState {}


final class AccountTransactionLoading extends SplashState {}
final class AccountTransactionSuccess extends SplashState {}
final class AccountTransactionError extends SplashState {}