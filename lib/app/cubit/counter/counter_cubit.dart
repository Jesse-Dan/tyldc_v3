import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(0, 0));
  void increment() => emit(CounterIncreased(state.age + 1, state.height + 1));
  void decrement() => emit(CounterDecreased(state.age - 1, state.height - 1));
}
