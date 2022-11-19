import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whether_app/api/wheather_repository.dart';
import 'package:whether_app/data/model/wheather_data.dart';
part 'wheather_state.dart';

class WheatherCubit extends Cubit<WheatherState> {
  WheatherRepository wheatherRepository = WheatherRepository();
  WheatherCubit() : super(WheatherLoading()) {
    loadWheatherData();
  }
  void loadWheatherData() async {
    emit(WheatherLoading());
    try {
      var data = await wheatherRepository.getWheatherData();
      emit(WheatherDataLoaded(data: data));
    } catch (e) {
      emit(WheatherErrorState(msg: e.toString()));
    }
  }
}
