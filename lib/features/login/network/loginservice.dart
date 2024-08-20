import 'package:dio/dio.dart';
import 'package:machine_interview_test/features/login/model/loginresponse.dart';
import 'package:machine_interview_test/features/login/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/network/apiclient.dart';

class Loginservice{
  Dio dio = Dio(apiclient);

  Future<Loginresponse?> getlogin({String? email,String? password}) async {

    try {
      final pref =SharedPreferences.getInstance();


      Response response = await dio.post(
          loginapi,
          data: {
            'email':email,
            'password':password
          }

      );

      if (response.statusCode == 200) {
        print('getresponse... ${response.data}');
        return Loginresponse.fromJson(response.data);
      } else if (response.statusCode == 401) {
        return Loginresponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        print('getresponse... 500${response.data}');
        return Loginresponse.fromJson(response.data);
      } else {
        print('getresponse... 3${response.data}');
        return Loginresponse.witherror('Unexpected error occurred.');
      }
    }  on DioException catch (e) {
      final errorResponse = e.response?.data;
      throw Loginresponse.witherror(errorResponse);
    }
  }


}