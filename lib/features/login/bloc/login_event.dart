part of 'login_bloc.dart';

 class LoginEvent extends Equatable {
   String? email;
   String? password;
   LoginEvent({this.email,this.password});
  @override
  List<Object> get props => [email ?? '',password??''];
}
