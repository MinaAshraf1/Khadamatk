import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gradproject/Features/forget_pass/data/models/forget_model.dart';
import 'package:gradproject/Features/forget_pass/data/repo/forget_repo_impl.dart';

part 'forget_cubit_state.dart';

class ForgetCubitCubit extends Cubit<ForgetCubitState> {
  final ForgetRepoImpl forgetRepoImpl;

  ForgetCubitCubit(this.forgetRepoImpl) : super(ForgetCubitInitial());

  Future<void> forget(ForgetModel forgetModel) async {
    emit(ForgetCubitLoading());
    try {
      final result = await forgetRepoImpl.forget(forgetModel);
      result.fold(
        (failure) {
          emit(ForgetCubitFailure(failure.errMessage ?? 'Error occurred'));
        },
        (message) {
          emit(ForgetCubitSuccess(message));
        },
      );
    } catch (e) {
      emit(ForgetCubitFailure('Unexpected error occurred'));
    }
  }
}
