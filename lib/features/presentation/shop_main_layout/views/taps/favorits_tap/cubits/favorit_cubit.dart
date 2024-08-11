import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/favorits_tap/cubits/favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState>
{
  FavoritCubit():super(FavoritInitailState());
  static FavoritCubit get(context)=>BlocProvider.of(context);




}