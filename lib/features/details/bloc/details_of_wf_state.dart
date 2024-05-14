part of 'details_of_wf_bloc.dart';

@immutable
sealed class DetailsOfWFState {}

final class DetailsOfWFInitial extends DetailsOfWFState {}

final class DetailsOfWFInitialState extends DetailsOfWFState {}

final class DetailsOfWFLoadingState extends DetailsOfWFState {}

final class DetailsOfWFLoadedState extends DetailsOfWFState {
  DetailsOfWFLoadedState({
    required this.detailsOfWF,
  });

  final DetailsOfWF detailsOfWF;
}

final class DetailsOfWFLoadingFailureState extends DetailsOfWFState {
  DetailsOfWFLoadingFailureState({
    this.exception,
  });

  final Object? exception;
}