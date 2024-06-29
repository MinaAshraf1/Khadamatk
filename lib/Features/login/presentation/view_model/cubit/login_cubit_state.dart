part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitSuccess extends LoginCubitState {}

final class LoginCubitFailure extends LoginCubitState {
  final String message;

  LoginCubitFailure(this.message);
  List<Object?> get props => [message];

  String? get errMessage => null;
}
