
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_interview_test/features/login/bloc/login_bloc.dart';
import 'package:machine_interview_test/features/login/component/loginbuttoncomponent.dart';
import 'package:machine_interview_test/features/shared/component/showmessage.dart';
import 'package:machine_interview_test/features/shared/component/versioncomponent.dart';
import 'package:machine_interview_test/features/shared/resources/color.dart';

import '../component/inputfield.dart';
import '../cubit/login_cubit.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: tealcolor, // Set the desired color
      statusBarBrightness: Brightness.light, // For iOS (light icons)
      statusBarIconBrightness: Brightness.light, // For Android (light icons)
    ));
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        color: white,
        child:    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Versioncomponent(),
              const SizedBox(
                height: 25,
              ),
              BlocProvider(
                create: (context) => LoginCubit(),

                child: BlocBuilder<LoginCubit,Map<String,String>>(
                  builder: (context,state){
                    String email = state['email']!;
                    String password = state['password']!;
                  return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Inpufield(
                          hintvalue: 'Email',
                          icon: Icons.email,
                          ispassword: false,
                          isreadonly: false,
                          textInputType: TextInputType.emailAddress,
                          onchange: (value){
                            context.read<LoginCubit>().updateEmail(value??'');
                          },
                        ),
                        const SizedBox(
                          height:20 ,
                        ),
                        Inpufield(
                          hintvalue: 'Password',
                          icon: Icons.lock,
                          ispassword: false,
                          isreadonly: false,
                          textInputType: TextInputType.visiblePassword,
                          onchange: (value){
                            context.read<LoginCubit>().updatePassword(value??'');
                          },
                        ),
                        const SizedBox(
                          height:25,
                        ),
                        Loginbuttoncomponent(
                          buttontext: 'Login',
                          height: 55,
                          width: width,
                          onpress: (loginbloc){
                            if(email.isNotEmpty && password.isNotEmpty){
                               loginbloc.add(LoginEvent(email: email,password: password));
                            }
                            else{
                              showmessage(message: 'Please complete login inputs',color: red);
                            }

                            log('parameter... ${email} ${password}');
                          },
                        ),


                      ],
                    );




                  },

                )
              ),




            ],
          ),
        ),





      ),
    );
  }
}
