
import 'package:shared_preferences/shared_preferences.dart';

void storedetails({String? token,int? time})async{

  final pref=await SharedPreferences.getInstance();
 pref.setString('token', token ?? '');
 pref.setInt('time', time??0);



}

Future<int?> getTime()async{
  final pref=await SharedPreferences.getInstance();
  return pref.getInt('time');
}