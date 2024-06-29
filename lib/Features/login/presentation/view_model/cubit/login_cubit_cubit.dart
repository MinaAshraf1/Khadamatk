import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/login/data/models/login_model.dart';
import 'package:gradproject/Features/login/data/repo/login_repo_impl.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  final LoginRepoImpl loginRepoImpl;

  LoginCubitCubit(this.loginRepoImpl) : super(LoginCubitInitial());

  String? token;

  Future<void> login(LoginModel loginModel) async {
    emit(LoginCubitLoading());
    try {
      final result = await loginRepoImpl.login(loginModel);
      result.fold(
        (failure) {
          emit(LoginCubitFailure(failure.errMessage));
        },
        (r) {
          token = r;
          emit(LoginCubitSuccess());
        },
      );
    } catch (e) {
      emit(LoginCubitFailure('Unexpected error occurred'));
    }
  }
}
