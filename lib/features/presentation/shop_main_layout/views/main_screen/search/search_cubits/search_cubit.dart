


import 'package:e_commerce_app/features/presentation/shop_main_layout/views/main_screen/search/search_cubits/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchCubit extends Cubit<SearchState>
{
  SearchCubit():super(SearchInitailState());
  static SearchCubit get(context)=>BlocProvider.of(context);



}