
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_interview_test/features/login/bloc/login_bloc.dart';
import 'package:machine_interview_test/features/shared/component/loadingbar.dart';
import 'package:machine_interview_test/features/shared/component/showmessage.dart';

import 'package:machine_interview_test/features/shared/resources/color.dart';
import 'package:machine_interview_test/features/shared/route/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/bloc/appversion_bloc.dart';
import '../../shared/component/textcomponent.dart';
import '../../shared/utility/functions.dart';
class Loginbuttoncomponent extends StatefulWidget {
  final double? height;
  final double? width;
  final String? buttontext;
  final Function(LoginBloc)? onpress;
  final LoginBloc? loginBloc;
  const Loginbuttoncomponent({super.key, this.height, this.width, this.buttontext, this.onpress, this.loginBloc});

  @override
  State<Loginbuttoncomponent> createState() => _LoginbuttoncomponentState();
}

class _LoginbuttoncomponentState extends State<Loginbuttoncomponent> {
  LoginBloc loginBloc=LoginBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {




    return Container(
        height: widget.height,
        margin: EdgeInsets.symmetric(horizontal: 12),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: tealcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0.0,
            ),
            onPressed: () {
              widget.onpress!(loginBloc);
            },
            child: BlocProvider(
              create: (_) => loginBloc,
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context,state){
                  if (state is LoginLoaded) {
                    if(state.response?.status==false){
                      showmessage(message: state.response?.message,color: red);

                    }
                   else if(state.response?.status==true){
                      storedetails(
                          token: state.response?.data?.accessToken,
                          time: state.response?.data?.validity
                      );
                      showmessage(message: 'login success',color: tealcolor);

                      context.go(homeroute);
                    }


                  } else if (state is LoginError) {
                    showmessage(message: state.error);

                  }


                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginInitial) {
                      return Textcomponent(
                        text: widget.buttontext,
                        fontsize: 15.0,
                        color: white,
                        fontWeight: FontWeight.w700,
                      );
                    }
                    if(state is LoginLoading){
                      return const Loadingbar(
                        color: white,
                      );
                    }
                    if (state is LoginLoaded) {
                      log('myresponse... ${state.response?.status}');
                      return Textcomponent(
                        text: widget.buttontext,
                        fontsize: 15.0,
                        color: white,
                        fontWeight: FontWeight.w700,
                      );
                    }
                    if (state is AppversionError) {
                      return Textcomponent(
                        text: widget.buttontext,
                        fontsize: 15.0,
                        color: white,
                        fontWeight: FontWeight.w700,
                      );
                    } else {
                      return Textcomponent(
                        text: widget.buttontext,
                        fontsize: 15.0,
                        color: white,
                        fontWeight: FontWeight.w700,
                      );
                    }
                
                  },
                ),
              ),
            )
        )
    );
  }
}





