
import 'package:machine_interview_test/features/login/model/loginresponse.dart';
import 'package:machine_interview_test/features/login/network/loginservice.dart';

class Loginrepository{
  final _service = Loginservice();

  Future<Loginresponse?> getlogin({String? email,String? password}) {
    return _service.getlogin(email: email,password: password);
  }

}
class NetworkError extends Error {}