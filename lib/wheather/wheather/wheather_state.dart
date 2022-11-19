part of 'wheather_cubit.dart';

abstract class WheatherState extends Equatable {}

class WheatherLoading extends WheatherState {
  @override
  List<Object?> get props => [];
}

class WheatherDataLoaded extends WheatherState {
  late WheatherData data;

  WheatherDataLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class WheatherErrorState extends WheatherState {
  String msg;
  WheatherErrorState({required this.msg});

  @override
  List<Object?> get props => [];
}
