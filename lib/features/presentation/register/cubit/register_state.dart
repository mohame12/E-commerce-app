abstract class RegisterState {}
class RegisterInitialDataState extends RegisterState{}
class RegisterLoadingdataState extends RegisterState{}
class RegisterSuccessDataState extends RegisterState{
  final String message;
  final bool status;

  RegisterSuccessDataState({required this.message,required this.status});
}
class RegisterfailerDataState extends RegisterState{
  final String e;

  RegisterfailerDataState({required this.e});
}

class RegisterOnchangeState extends RegisterState{}
class RegisterVisiableState extends RegisterState{}
