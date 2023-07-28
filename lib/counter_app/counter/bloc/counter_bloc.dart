import 'package:bloc/bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // on<CounterDecrementPressed>((event, emit) {
    //   // handle incoming `CounterDecrementPressed` event
    //   emit(state - 1);
    // });
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print("onChange $change");
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print("onTransition $transition");
  }
}
