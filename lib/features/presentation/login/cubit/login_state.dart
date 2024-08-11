import '../../shop_main_layout/views/main_screen/search/search_model/search_model.dart';
import '../../shop_main_layout/views/taps/home_tap/model/home_ttap_model.dart';
import '../../shop_main_layout/views/taps/settings_tap/models/profile_model.dart';
import '../../shop_main_layout/views/taps/settings_tap/models/profile_update_data.dart';

abstract class LoginState {}
class LoginInitalState extends LoginState{}


class LoginLoadingDataState extends LoginState{}
class LoginSuccessDataState extends LoginState{

final bool state;
final String message;
final String token;

  LoginSuccessDataState({required this.message,required this.state,required this.token});
}
class LoginFaileurDataState extends LoginState{
  final String e;
  LoginFaileurDataState({required this.e});
}


class LoginValidateState extends LoginState{}
class LoginVisiableState extends LoginState{}
class LoginOnchangeState extends LoginState{}



class HomeTapLoadingDataState extends LoginState{}
class HomeTapSuccessDataState extends LoginState{
  final HomeTapModel model;

  HomeTapSuccessDataState({required this.model});
}
class HomeTapFailuerState extends LoginState{
  final String e;
  HomeTapFailuerState({required this.e});
}
class ChangeSlider extends LoginState{}


class ChangeFavoritIcon extends LoginState{}

class FavoritLoadingState extends LoginState{}
class FavoritSuccessState extends LoginState{
  final String msg;
  final bool state;

  FavoritSuccessState({required this.msg,required this.state});
}
class FavoritFailurState extends LoginState{
  final String e;

  FavoritFailurState({required this.e});
}

class FavoritChangeState extends LoginState{}


class FavoritLoadingdataState extends LoginState{}
class FavoritSuccessdataState extends LoginState{}

class FavoritFailuerdataState extends LoginState{
  final String e;

  FavoritFailuerdataState({required this.e});
}


class ProfileLoadingGettingDataState extends LoginState{}
class ProfileSuccessGettingDataState extends LoginState{
  final ProfileData model;

  ProfileSuccessGettingDataState({required this.model});

}
class ProfileFailuerState extends LoginState{
  final String e;

  ProfileFailuerState({required this.e});

}



class ProfileLoadingUpdataDataState extends LoginState{}
class ProfileSuccessUpdateDataState extends LoginState{
  final ProfileupdateData model;

  ProfileSuccessUpdateDataState({required this.model});
}


class ShowBottomSheet extends LoginState{}
class Refrech extends LoginState{}
class Logout extends LoginState{
}



class SearchInitailState extends LoginState{}
class SearchLoadingState extends LoginState{}
class SearchSuccessState extends LoginState{
  final SearchModel ?model;

  SearchSuccessState({required this.model});
}
class SearchFailiurState extends LoginState{
  final String e;

  SearchFailiurState({required this.e});

}
