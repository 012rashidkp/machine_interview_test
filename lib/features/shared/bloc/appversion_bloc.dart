import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:machine_interview_test/features/shared/model/appversionresponse.dart';
import 'package:machine_interview_test/features/shared/repository/versionrepository.dart';

part 'appversion_event.dart';
part 'appversion_state.dart';

class AppversionBloc extends Bloc<AppversionEvent, AppversionState> {
  AppversionBloc() : super(AppversionInitial()) {
    final  repository=Versionrepository();
    on<AppversionEvent>((event, emit) async {
      try {
        emit(AppversionLoading());
        final response = await repository.getappversion();
        emit(AppversionLoaded(response: response));
        if (response?.error!=null) {
          emit(AppversionError(error: response?.error));
        }
      } on NetworkError {
        emit(AppversionError(error: "Failed to fetch data. is your device online?"));
      }
    });
  }
}
