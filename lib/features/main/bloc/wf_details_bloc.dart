import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../repositories/main/models/wf_details.dart';
import '../../../repositories/main/wf_details_repository.dart';

part 'wf_details_event.dart';

part 'wf_details_state.dart';

class WFDetailsBloc extends Bloc<WFDetailsEvent, WFDetailsState> {
  WFDetailsBloc(this.wfDetailsRepository) : super(WFDetailsInitial()) {
    on<LoadWFDetailsEvent>((event, emit) async {
      try {
        print('Show first event');
        final wfDetailsList = await wfDetailsRepository.getWFDetails();
        emit(WFDetailsLoaded(wfDetails: wfDetailsList));
      } catch (e) {
        emit(WFDetailsLoadingFailure(exception: e));
      }

    });
  }
  final WFDetailsRepository wfDetailsRepository;
}
