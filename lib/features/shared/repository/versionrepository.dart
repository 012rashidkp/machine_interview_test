
import 'package:machine_interview_test/features/shared/model/appversionresponse.dart';
import 'package:machine_interview_test/features/shared/network/versionservice.dart';

class Versionrepository{
  final _service = Versionservice();

  Future<Appversionresponse?> getappversion() {
    return _service.getappversion();
  }

}
class NetworkError extends Error {}