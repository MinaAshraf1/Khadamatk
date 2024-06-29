import 'package:bloc/bloc.dart';
import 'package:gradproject/Features/home/data/models/user_data.dart';
import 'package:gradproject/Features/home/data/repo/user_repo.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(UserInitial());
  final UserRepo userRepo;
  Future<void> user({required String token}) async {
    emit(UserLoading());
    var result = await userRepo.user(token: token);
    result.fold((l) {
      emit(UserFailure(errMessage: l.errMessage));
    }, (r) {
      emit(UserSuccess(r));
    });
  }
}
