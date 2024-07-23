abstract class CategoryTapState {}
class CategoryTapInitialState extends CategoryTapState{}
class CategoryTapLoadingDataState extends CategoryTapState{}
class CategoryTapSuccessDataState extends CategoryTapState{}
class CategoryTapFailuerState extends CategoryTapState{
  final String e;
  CategoryTapFailuerState({required this.e});
}
class ChangeSliderCategoryState extends CategoryTapState{}