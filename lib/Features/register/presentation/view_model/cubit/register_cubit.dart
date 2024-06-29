import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/register/data/models/register_model.dart';
import 'package:gradproject/Features/register/data/repo/register_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepoImpl registerRepoImpl;
  RegisterCubit(this.registerRepoImpl) : super(RegisterInitial());
  String? token;

  Future<void> register(RegisterModel registerModel) async {
    emit(RegisterLoading());
    try {
      final result = await registerRepoImpl.register(registerModel);
      result.fold(
        (failure) {
          emit(RegisterFailure(failure.errMessage));
        },
        (r) {
          token = r;
          emit(RegisterSuccess());
        },
      );
    } catch (e) {
      emit(RegisterFailure('Unexpected error occurred'));
    }
  }
}
