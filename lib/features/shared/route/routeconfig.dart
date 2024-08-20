

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_interview_test/features/login/presentation/loginscreen.dart';
import 'package:machine_interview_test/features/post/presentation/postscreen.dart';
import 'package:machine_interview_test/features/shared/route/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();



final router = GoRouter(
initialLocation:  isToken==true?homeroute:loginroute,
redirect: (BuildContext context, GoRouterState state) async {
  final pref = await SharedPreferences.getInstance();
  final token = pref.getString('token');


  if(token!=null){
    return homeroute;

  }
  else{
   return loginroute;
  }
},
navigatorKey: GlobalKey<NavigatorState>(),
  routes: [
    GoRoute(
      name: 'login', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: loginroute,
      builder: (context, state) => const Loginscreen(),
    ),
    GoRoute(
      name: 'post', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: homeroute,
      builder: (context, state) => const Postscreen(),
    ),

  ]
);


Future<bool> isToken() async {
  final pref = await SharedPreferences.getInstance();
  final token = pref.getString('token');
  return token != null && token.isNotEmpty;
}