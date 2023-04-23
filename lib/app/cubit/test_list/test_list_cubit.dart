import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tyldc_v3/app/model/test_list_model.dart';

part 'test_list_state.dart';

class TestListCubit extends Cubit<TestListState> {
  TestListCubit() : super(const TestListInitial(<TestDataModel>[]));

  void addUser(TestDataModel testUser) {
    emit(TestListMemberAdded(
        List<TestDataModel>.from(state.listOfTestData)..add(testUser)));
    log(state.listOfTestData.length.toString());
  }

  void removeUser(TestDataModel testUser) {
    emit(TestListMemberRemoved(
        List<TestDataModel>.from(state.listOfTestData)..remove(testUser)));
  }
}
