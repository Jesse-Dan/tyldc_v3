
import 'package:equatable/equatable.dart';
import 'package:tyldc_v3/app/model/api_data_model.dart';

abstract class ApiTestEvent extends Equatable {
  const ApiTestEvent();

  @override
  List<Object> get props => [];

  
  
}

class FetchDataLaodingEvent extends ApiTestEvent{
  @override
  List<Object> get props => [];}

class FetchData extends ApiTestEvent{
  @override
  List<Object> get props => [];}