part of 'test_list_cubit.dart';

abstract class TestListState extends Equatable {
  final List<TestDataModel> listOfTestData;
  const TestListState(this.listOfTestData);

  @override
  List<Object> get props => [listOfTestData];
}

class TestListInitial extends TestListState {
  const TestListInitial(super.listOfTestData);

  @override
  List<Object> get props => [listOfTestData];
}

class TestListMemberAdded extends TestListState {
  const TestListMemberAdded(super.listOfTestData);

  @override
  List<Object> get props => [listOfTestData];
}

class TestListMemberRemoved extends TestListState {
  const TestListMemberRemoved(super.listOfTestData);

  @override
  List<Object> get props => [listOfTestData];
}
