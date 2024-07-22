import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/model/home_ttap_model.dart';

abstract class HomeTapState {}
class HomeTapInitialState extends HomeTapState{}
class HomeTapLoadingDataState extends HomeTapState{}
class HomeTapSuccessDataState extends HomeTapState{
  final HomeTapModel model;

  HomeTapSuccessDataState({required this.model});
}
class HomeTapFailuerState extends HomeTapState{
  final String e;
  HomeTapFailuerState({required this.e});
}
class ChangeSlider extends HomeTapState{}


class ChangeFavoritIcon extends HomeTapState{}

