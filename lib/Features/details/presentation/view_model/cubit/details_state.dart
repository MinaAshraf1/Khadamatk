part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
final class DetailsLoading extends DetailsState {}
final class DetailsFailure extends DetailsState {
final String errMessage;

  DetailsFailure({required this.errMessage});
  
}
final class DetailsSuccess extends DetailsState {
final List<Details> data;

  DetailsSuccess({required this.data});


}

