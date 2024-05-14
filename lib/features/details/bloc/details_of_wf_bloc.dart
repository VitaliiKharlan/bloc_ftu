import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../repositories/main/details_of_wf_repository.dart';
import '../../../repositories/main/models/details_of_wf.dart';

part 'details_of_wf_event.dart';

part 'details_of_wf_state.dart';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class DetailsOfWFBloc extends Bloc<DetailsOfWFEvent, DetailsOfWFState> {
  // late final DetailsOfWFRepository detailsOfWFRepository;

  DetailsOfWFBloc() : super(DetailsOfWFInitialState()) {
    on<LoadDetailsOfWFEvent>(
      _loadDetailsOfWF,
      transformer: debounceDroppable(
        const Duration(milliseconds: 500),
      ),
    );
  }

  _loadDetailsOfWF(
      LoadDetailsOfWFEvent event, Emitter<DetailsOfWFState> emit) async {
    try {
      if (state is! DetailsOfWFLoadedState) {
        emit(DetailsOfWFLoadingState());
        print('Loading...');
      }

      final detailsOfWFKyiv = await DetailsOfWFRepository().getDetailsOfWF();
      emit(DetailsOfWFLoadedState(detailsOfWF: detailsOfWFKyiv));
      print('Show first event');
    } catch (e) {
      emit(DetailsOfWFLoadingFailureState(exception: e));
    }
  }
}
