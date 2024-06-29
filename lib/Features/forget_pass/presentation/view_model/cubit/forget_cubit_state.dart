part of 'forget_cubit_cubit.dart';

@immutable
sealed class ForgetCubitState {}

final class ForgetCubitInitial extends ForgetCubitState {}

final class ForgetCubitLoading extends ForgetCubitState {}

final class ForgetCubitSuccess extends ForgetCubitState {
  final String message;

  ForgetCubitSuccess(this.message);
}

final class ForgetCubitFailure extends ForgetCubitState {
  final String message;

  ForgetCubitFailure(this.message);

  List<Object?> get props => [message];

  String? get errMessage => null;
}
