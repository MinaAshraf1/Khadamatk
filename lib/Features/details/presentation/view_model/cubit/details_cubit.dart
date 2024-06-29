import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproject/Features/details/data/models/details/details.dart';
import 'package:gradproject/Features/details/data/repo/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitial());
  final DetailsRepo detailsRepo;
  List<Details> allDetails = [];

  Future<void> details({required String url, required String token}) async {
    emit(DetailsLoading());
    var result = await detailsRepo.get(url: url, token: token);
    result.fold((l) {
      emit(DetailsFailure(errMessage: l.errMessage));
    }, (r) {
      allDetails = r;
      emit(DetailsSuccess(data: r));
    });
  }

  void searchDetails(String query) {
    if (query.isEmpty) {
      emit(DetailsSuccess(data: allDetails));
    } else {
      final filteredDetails = allDetails.where((element) => element.name != null && element.name!.contains(query)).toList();
      emit(DetailsSuccess(data: filteredDetails));
    }
  }
}
