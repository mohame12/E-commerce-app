import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/settings_tap/models/profile_model.dart';

import '../models/profile_update_data.dart';

abstract class ProfileState{}
class ProfileInitalState extends ProfileState{}
class ProfileLoadingGettingDataState extends ProfileState{}
class ProfileSuccessGettingDataState extends ProfileState{
  final ProfileData model;

  ProfileSuccessGettingDataState({required this.model});

}
class ProfileFailuerState extends ProfileState{
  final String e;

  ProfileFailuerState({required this.e});

}



class ProfileLoadingUpdataDataState extends ProfileState{}
class ProfileSuccessUpdateDataState extends ProfileState{
  final ProfileupdateData model;

  ProfileSuccessUpdateDataState({required this.model});
}


class ShowBottomSheet extends ProfileState{}
class Refrech extends ProfileState{}
class Logout extends ProfileState{}