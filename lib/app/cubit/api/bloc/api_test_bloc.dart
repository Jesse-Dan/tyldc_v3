import 'package:bloc/bloc.dart';
import 'package:tyldc_v3/app/cubit/api/bloc/api_test_event.dart';
import 'package:tyldc_v3/app/cubit/api/bloc/api_test_state.dart';
import 'package:tyldc_v3/app/repo/repo.dart';

class ApiTestBloc extends Bloc<ApiTestEvent, ApiTestState> {
  final ApiRepository apiService;
  ApiTestBloc(this.apiService) : super(const ApiTestInitial(apiDataList: [])) {
     
    on<FetchDataLaodingEvent>((event, emit)async {
      emit(const ApiTestLoading(apiDataList: []));
    });
  }
}
