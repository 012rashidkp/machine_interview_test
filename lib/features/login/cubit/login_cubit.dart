import 'package:bloc/bloc.dart';




class LoginCubit extends Cubit<Map<String, String>> {
  LoginCubit() : super({'email': '', 'password': ''});

  void updateEmail(String email) {
    emit({...state, 'email': email});
  }

  void updatePassword(String password) {
    emit({...state, 'password': password});
  }

  bool validateFields() {
    final email = state['email'] ?? '';
    final password = state['password'] ?? '';
    if (email.isEmpty || password.isEmpty) {
      return false;
    }
    return true;
  }
}
