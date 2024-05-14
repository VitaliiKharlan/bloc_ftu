import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../repositories/main/models/wf_details.dart';
import '../../../repositories/main/wf_details_repository.dart';

part 'wf_details_event.dart';

part 'wf_details_state.dart';

class WFDetailsBloc extends Bloc<WFDetailsEvent, WFDetailsState> {
  late final WFDetailsRepository wfDetailsRepository;

  WFDetailsBloc(this.wfDetailsRepository) : super(WFDetailsInitialState()) {
    on<LoadWFDetailsEvent>(_loadWFDetails);
  }

  _loadWFDetails(LoadWFDetailsEvent event, Emitter emit) async {
    try {
      if (state is! WFDetailsLoadedState) {
        emit(WFDetailsLoadingState());
        print('Loading...');
      }

      final wfDetailsKyiv = await wfDetailsRepository.getWFDetails();
      emit(WFDetailsLoadedState(wfDetails: wfDetailsKyiv));
      print('Show first event');
    } catch (e) {
      emit(WFDetailsLoadingFailureState(exception: e));
    }
  }
}
