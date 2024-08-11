import 'package:e_commerce_app/features/presentation/shop_main_layout/cubit/homecubit_cubit.dart';
import 'package:e_commerce_app/features/presentation/shop_main_layout/cubit/homecubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopMain extends StatelessWidget {
   const ShopMain({super.key});
  static const String id='ShopMain';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    HomeCubit cubit=HomeCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:Theme(data:Theme.of(context).copyWith(splashColor: Colors.transparent,highlightColor: Colors.transparent) , child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        elevation: 0,

        backgroundColor:Colors.transparent ,
        currentIndex: cubit.navindex,
        onTap: cubit.ontap,
        items: cubit.bottomNavigationBarItem,
      ),),
      body: cubit.navwidgetslist[cubit.navindex],

    );
  },
),
);
  }
}
