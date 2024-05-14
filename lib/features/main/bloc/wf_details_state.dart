part of 'wf_details_bloc.dart';

@immutable
sealed class WFDetailsState {}

final class WFDetailsInitialState extends WFDetailsState {}

final class WFDetailsLoadingState extends WFDetailsState {}

final class WFDetailsLoadedState extends WFDetailsState {
  WFDetailsLoadedState({
    required this.wfDetails,
  });

  final WFDetails wfDetails;
}

final class WFDetailsLoadingFailureState extends WFDetailsState {
  WFDetailsLoadingFailureState({
    this.exception,
  });

  final Object? exception;
}
