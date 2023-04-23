part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int age;
  final double height;
  CounterState(this.age, this.height);

  @override
  // TODO: implement props
  List<Object?> get props => [age, height];
}

class CounterInitial extends CounterState {
  CounterInitial(super.age, super.height);

  @override
  // TODO: implement props
  List<Object?> get props => [age, height];
}

class CounterIncreased extends CounterState {
  CounterIncreased(super.age, super.height);

  @override
  // TODO: implement props
  List<Object?> get props => [age, height];
}

class CounterDecreased extends CounterState {
  CounterDecreased(super.age, super.height);

  @override
  // TODO: implement props
  List<Object?> get props => [age, height];
}
