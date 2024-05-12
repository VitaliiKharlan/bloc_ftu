import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wf_details_event.dart';
part 'wf_details_state.dart';

class WfDetailsBloc extends Bloc<WfDetailsEvent, WfDetailsState> {
  WfDetailsBloc() : super(WfDetailsInitial()) {
    on<WfDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
