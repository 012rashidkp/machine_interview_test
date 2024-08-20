import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_interview_test/features/login/model/loginresponse.dart';
import 'package:machine_interview_test/features/login/repository/loginrepository.dart';
import 'package:machine_interview_test/features/shared/route/constant.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final  repository=Loginrepository();
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final response = await repository.getlogin(
           email: event.email,
          password: event.password

        );
        emit(LoginLoaded(response: response));
        if (response?.error!=null) {
          emit(LoginError(error: response?.error));
        }
      } on NetworkError {
        emit(LoginError(error: "Failed to fetch data. is your device online?"));
      }
    });
  }
}
