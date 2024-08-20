part of 'appversion_bloc.dart';

abstract class AppversionState extends Equatable {
  const AppversionState();
  @override
  List<Object> get props => [];
}

class AppversionInitial extends AppversionState {}

class AppversionLoading extends AppversionState{}

class AppversionLoaded extends AppversionState{
  final Appversionresponse? response;

  AppversionLoaded({this.response});
}
class AppversionError extends AppversionState{
  final String? error;

  AppversionError({this.error});
}
