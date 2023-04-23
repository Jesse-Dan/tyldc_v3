import 'package:equatable/equatable.dart';

import '../../../model/api_data_model.dart';

abstract class ApiTestState extends Equatable {
  final List<Api> apiDataList;
  const ApiTestState({required this.apiDataList});

  @override
  List<Object> get props => [apiDataList];
}

class ApiTestInitial extends ApiTestState {
  const ApiTestInitial({required super.apiDataList});

  @override
  List<Object> get props => [apiDataList];
}

class ApiTestLoaded extends ApiTestState {
  const ApiTestLoaded({required super.apiDataList});

  @override
  List<Object> get props => [apiDataList];
}

class ApiTestLoadingError extends ApiTestState {
  const ApiTestLoadingError({required super.apiDataList});

  @override
  List<Object> get props => [apiDataList];
}

class ApiTestLoading extends ApiTestState {
  const ApiTestLoading({required super.apiDataList});

  @override
  List<Object> get props => [apiDataList];
}
