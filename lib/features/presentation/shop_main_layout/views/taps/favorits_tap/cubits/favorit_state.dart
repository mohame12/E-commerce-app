abstract class FavoritState {}
class FavoritInitailState extends FavoritState{}
class FavoritLoadingState extends FavoritState{}
class FavoritSuccessState extends FavoritState{}

class FavoritFailuerState extends FavoritState{
  final String e;

  FavoritFailuerState({required this.e});
}