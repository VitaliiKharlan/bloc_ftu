part of 'wf_details_bloc.dart';

@immutable
sealed class WFDetailsState {}

final class WFDetailsInitial extends WFDetailsState {}

final class WFDetailsLoading extends WFDetailsState {}

final class WFDetailsLoaded extends WFDetailsState {
  WFDetailsLoaded({
    required this.wfDetails,
  });

  final WFDetails wfDetails;
}

final class WFDetailsLoadingFailure extends WFDetailsState {
  WFDetailsLoadingFailure({
    this.exception,
  });

  final Object? exception;
}
