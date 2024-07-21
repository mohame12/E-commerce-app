abstract class LoginState {}
class LoginInitalState extends LoginState{}


class LoginLoadingDataState extends LoginState{}
class LoginSuccessDataState extends LoginState{

final bool state;
final String message;

  LoginSuccessDataState({required this.message,required this.state});
}
class LoginFaileurDataState extends LoginState{
  final String e;
  LoginFaileurDataState({required this.e});
}


class LoginValidateState extends LoginState{}
class LoginVisiableState extends LoginState{}
class LoginOnchangeState extends LoginState{}