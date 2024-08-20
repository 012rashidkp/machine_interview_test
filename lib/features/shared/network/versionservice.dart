
import 'package:dio/dio.dart';
import 'package:machine_interview_test/features/shared/model/appversionresponse.dart';
import 'package:machine_interview_test/features/shared/network/api.dart';

import 'apiclient.dart';

class Versionservice{
  Dio dio = Dio(apiclient);

  Future<Appversionresponse?> getappversion() async {
    try {
      Response response = await dio.get(
        appversionapi
      );

      if (response.statusCode == 200) {
        print('getresponse... ${response.data}');
        return Appversionresponse.fromJson(response.data);
      } else if (response.statusCode == 401) {
        return Appversionresponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        print('getresponse... 500${response.data}');
        return Appversionresponse.fromJson(response.data);
      } else {
        print('getresponse... 3${response.data}');
        return Appversionresponse.witherror('Unexpected error occurred.');
      }
    }  on DioException catch (e) {
      final errorResponse = e.response?.data;
      throw Appversionresponse.witherror(errorResponse);
    }
  }






}