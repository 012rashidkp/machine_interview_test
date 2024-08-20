


import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_interview_test/features/shared/component/showmessage.dart';
import 'package:machine_interview_test/features/shared/route/constant.dart';
import 'package:machine_interview_test/features/shared/utility/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/resources/color.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({super.key});

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {

  @override
  void initState() {


    Future.delayed(const Duration(milliseconds: 60000), ()async {
      final pref= await SharedPreferences.getInstance();
      pref.clear();
      showmessage(message: 'Session Expired',color: red);

        context.go(loginroute);



    });

    super.initState();
  }
  Future<String?> gettoken() async {
    final pref=await SharedPreferences.getInstance();
    return pref.getString('token');
  }


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;





    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        color: white,


      ),
    );
  }
}




