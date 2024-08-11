import 'package:e_commerce_app/features/presentation/shop_main_layout/views/main_screen/search/search_model/search_model.dart';

abstract class SearchState {}
class SearchInitailState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchSuccessState extends SearchState{
  final SearchModel ?model;

  SearchSuccessState({required this.model});
}
class SearchFailiurState extends SearchState{
  final String e;

  SearchFailiurState({required this.e});

}