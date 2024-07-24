import 'package:e_commerce_app/features/presentation/shop_main_layout/cubit/homecubit_state.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/categors_tap/veiws/categoris_tap.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/favorits_tap/views/favorait_tap.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/home_tap/view/home_tap.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/views/taps/settings_tap/setting_tap.dart';
import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/nav_Bar_item_selected.dart';

class HomeCubit extends Cubit<HomeState>
{
  HomeCubit():super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);

   int navindex=0;
  List<BottomNavigationBarItem> get bottomNavigationBarItem=>[
    BottomNavigationBarItem(icon:NavSelectedIcon(icon: Icons.home, color:navindex==0?defColor:Colors.white,) ,label: '',),
    BottomNavigationBarItem(icon:NavSelectedIcon(icon: Icons.apps, color:navindex==1?defColor:Colors.white,) ,label: '',),
    BottomNavigationBarItem(icon:NavSelectedIcon(icon: Icons.favorite, color:navindex==2?defColor:Colors.white,) ,label: '',),
    BottomNavigationBarItem(icon:NavSelectedIcon(icon: Icons.settings, color:navindex==3?defColor:Colors.white,) ,label: '',),

  ];

  List<Widget>navwidgetslist=[
    const HomeTap(),
    const CategorisTap(),
    const FavoritTap(),
    const SettingsTap(),
  ];

  ontap(int ind)
  {
    navindex=ind;
    emit(HomeNavChangeState());
  }


}
